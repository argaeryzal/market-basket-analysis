# Market Basket Analysis menggunakan Algoritma Apriori
Kita mungkin sering mendengar mengenai bagaimana banyak bisnis berkembang dan maju dengan cepat karena inovasi, baik itu inovasi di sisi produk ataupun bisnis.

Salah satu inovasi bisnis di bidang ritel adalah mencari asosiasi atau hubungan antar produk dari data transaksi penjualan yang bertujuan untuk:

- dipaketkan dan dijual bersamaan.
- memberikan rekomendasi produk kepada seseorang.
- menyusun rak display.
- menyusun halaman produk e-commerce.

Semua hal ini bertujuan untuk meningkatkan penjualan sekaligus memecahkan masalah inventory – karena produk yang tidak begitu laku jika dipasangkan dengan tepat akan lebih menarik dan punya kemungkinan besar dibeli dalam satu paket. Proses ini merupakan proses analisa yang disebut dengan Market Basket Analysis (MBA). 
Market Basket Analysis adalah sebuah teknik untuk menemukan pola unik dari sebuah data.

## Algoritma Apriori dan Association Rules
Bicara mengenai pemaketan produk sebenarnya adalah mencari produk-produk yang memiliki hubungan atau asosiasi kuat di dalam transaksi. Hubungan "kuat" disini akan dilihat berdasarkan proporsi jumlah kemunculan kombinasi produk yang akan dipaketkan dengan keseluruhan transaksi.

Mari kita lihat contoh pada gambar berikut. Nomor transaksi (1 s/d 5) menunjukkan nomor struk belanja. Sedangkan gambar buah yang berwarna menunjukkan produk atau item yang dibeli.

![item_transaction_example](https://user-images.githubusercontent.com/20991856/134437286-a8bc1b4b-c1df-4f6d-a8aa-b93a6df06a2f.PNG)

Pada gambar terlihat ada dua transaksi dimana terdapat buah rambutan dan pisang. Dan dimana terdapat pisang maka ada rambutan, dan sebaliknya. Ini menunjukkan hubungan atau asosiasi yang kuat diantara dua produk buah ini.

Apel sendiri terdapat di seluruh transaksi, sehingga ada atau tidak ada produk buah lain tidak menjadi "masalah" buat Apel. Istilahnya, untuk laku maka Apel jual mahal... tidak memerlukan apapun jadi pendampingnya. Bisa dikatakan, tidak ada asosiasi antara apel dengan produk apapun. Jeruk, apel dan rambutan ada dua kali muncul, tapi jeruk bisa muncul sendirian juga bersama apel. Sehingga kombinasi paket jeruk, apel dan rambutan walaupun ada asosiasi tapi tidak sekuat apel dan rambutan.

Nah, terlihat kan ada kombinasi-kombinasi yang perlu diperiksa? Untuk 4 item dari contoh transaksi kita, dengan minimal 2 item per transaksi maka ada 9 kombinasi yang perlu dicek. Dengan makin banyaknya item maka kombinasi juga akan berkembang cepat.

Sebagai gambaran, jika terdapat 1.000 item, maka kemungkinan terdapat jutaan kombinasi yang harus diproses. Jumlah sebesar ini tentunya tidak bisa manual dan butuh bantuan algoritma komputer untuk memprosesnya.

Dan algoritma yang bisa kita gunakan adalah algoritma apriori yang merupakan algoritma di kategori association rules pada literatur machine learning. Algoritma ini akan menghasilkan kombinasi-kombinasi yang kemudian disusun dalam bentuk rule "Jika membeli ini.... maka akan juga membeli... ".

Ada cukup banyak penerapan dari association rules , seperti di dunia cyber security untuk mendeteksi intrusi jaringan, di bidang sales marketing untuk pemaketan produk, mencari pola pemakaian web, dan lain-lain.

## Dataset Source
Dataset yang akan digunakan dalam analysis kali ini berasal dari DQLab Academy, dengan link sebagai berikut https://storage.googleapis.com/dqlab-dataset/data_transaksi.txt

## Item Frequency
Kita akan menghasilkan informasi menggunakan fungsi itemFrequency dengan input objek transaction, dan hasilnya berupa visualisasi plot seperti gambar dibawah ini.

![item_frequency_plot](https://user-images.githubusercontent.com/20991856/134439526-de5e5fd3-7bd1-482d-97d0-7160d10ef542.png)

Dari distribusi ini, terlihat item Teh Celup paling laku dan Gula paling sedikit transaksinya.

## Visualisasi Output

Berikut adalah visualisasi yang dihasilkan dari rules yang telah kita filter dengan lift di atas nilai 1.1.

![visualisasi_mba](https://user-images.githubusercontent.com/20991856/134439193-28577743-495c-4886-a2a8-c84be6347a29.png)

Lingkaran disini adalah titik pertemuan (asosiasi) dari item-item yang ada, dimana terdapat tanda panah sebagai garis penghubungnya. Tiap Item disini berupa teks.

Besarnya bulatan menunjukkan popularitas, dan intensitas warna menunjukkan lift. Terlihat disini Gula ke Sirup, dan Pet Food ke Sirup memiliki lift yang relatif tinggi tapi supportnya tidak terlalu besar.
