library(arules)
library(arulesViz)

# Membuat variabel transaksi
transaksi <- read.transactions(file="https://storage.googleapis.com/dqlab-dataset/data_transaksi.txt", format="single", sep="\t", cols=c(1,2), skip=1)

# Menampilkan daftar item transaksi
transaksi@itemInfo

# Menampilkan daftar kode transaksi
transaksi@itemsetInfo

# Tampilan transaksi dalam bentuk matrix
transaksi@data

# Menampilkan item frequency
itemFrequency(transaksi)

# Menampilkan 3 item terbanyak
data_item <- itemFrequency(transaksi, type="absolute")

#Melakukan sorting pada data_item
data_item <- sort(data_item, decreasing=TRUE)

#Mengambil 3 item pertama
data_item <- data_item[1:3]

#Konversi data_item menjadi data frame dengan kolom Nama_Produk dan Jumlah
data_item <- data.frame("Nama Produk"=names(data_item), "Jumlah"=data_item, row.names=NULL)

print(data_item)

# Grafik itemFrequency
itemFrequencyPlot(transaksi)

# Melihat Itemset per Transaksi dengan Inspect
inspect(transaksi)

# Menghasilkan Rules dengan Apriori
apriori(transaksi)

#Menghasilkan association rules dan disimpan sebagai variable mba
mba <- apriori(transaksi)

#Melihat isi dari rules dengan menggunakan fungsi inspect
inspect(mba)

#Filter rhs dengan item "Sirup" dan tampilkan
inspect(subset(mba, rhs %in% "Sirup"))

#Filter lhs dengan item "Gula" dan tampilkan
inspect(subset(mba, lhs %in% "Gula"))

#Filter lhs dengan item Pet Food dan rhs dengan item Sirup
inspect(subset(mba, lhs %in% "Pet Food" & rhs %in% "Sirup"))

#Menghasilkan Rules dengan Parameter Support dan Confidence
apriori(transaksi,parameter = list(supp = 0.1, confidence = 0.5))

#Inspeksi Rules Yang Dihasilkan
mba <- apriori(transaksi,parameter = list(supp = 0.1, confidence = 0.5))
inspect(mba)

#Filter dimana lhs atau rhs keduanya memiliki item Teh Celup
inspect(subset(mba, lhs %in% "Teh Celup" | rhs %in% "Teh Celup"))

#Filter dimana lhs atau rhs memiliki item Teh Celup dan Lift diatas 1
inspect(subset(mba, (lhs %in% "Teh Celup" | rhs %in% "Teh Celup") & lift>1))

#Filter dimana lhs memiliki item Gula dan Pet Food
inspect(subset(mba, (lhs %ain% c("Pet Food","Gula"))))

#Visualisasi Rules dengan Graph
plot(subset(mba, lift>1.1), method="graph")