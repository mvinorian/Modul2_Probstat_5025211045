<div align=center>

# **Praktikum Modul 2 Probabilitas dan Statistik**

| Nama | Muhammad Ersya Vinorian |
|:-----|:------------------------|
| NRP  | 5025211045              |

</div>
<br/>
<div align=justify>

### **Soal 1**

Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas $A$ terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas $A$, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas $A$. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas $A$.

<div align=center>

| Responden |  X  |  Y  |
|:---------:|:---:|:---:|
| 1         | 78  | 100 |
| 2         | 75  | 95  |
| 3         | 67  | 70  |
| 4         | 77  | 90  |
| 5         | 70  | 90  |
| 6         | 72  | 90  |
| 7         | 78  | 89  |
| 8         | 74  | 90  |
| 9         | 77  | 100 |

</div>

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari responden ke-3 ketika belum melakukan aktivitas $A$ sebanyak 67, dan setelah melakukan aktivitas $A$ sebanyak 70.

<ol type="a">
<li>

Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel di atas!

</li>

```r
X <- c(78,75,67,77,70,72,78,74,77)
Y <- c(100,95,70,90,90,90,89,90,100)

std_deviasi = sd(Y-X)
print(std_deviasi)

# 6.359595
```

![image](https://user-images.githubusercontent.com/54766683/207343319-e84d7ab0-650f-43b3-8ba2-b94011e6603e.png)

> Standar deviasi dari data selisih pasangan pengamatan tersebut adalah $\sigma=6.359595$.

<li>

Carilah nilai $t$ (*$p$-value*)!

</li>

```r
t.test(X, Y, paired = TRUE)

# t = -7.6525
# p-value = 0.000006003
```

![image](https://user-images.githubusercontent.com/54766683/207333758-14c8d721-22f6-49a6-9734-35c6a7012351.png)

> Didapatkan nilai $t = -7.6525$ dan $p\text{-value} = 0.000006003$.

<li>

Tetukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kada saturasi oksigen sebelum dan sesudah melakukan aktivitas $A$, jika diketahui tingkat signifikansi $\alpha=5\%$ serta $H_0:$ "tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas $A$"!

</li>

```r
t.test(X, Y, paired = TRUE, conf.level = 0.95)

# alternative hypothesis: true mean difference is not equal to 0
```

![image](https://user-images.githubusercontent.com/54766683/207345960-5375b9dd-9df4-44fd-8189-ebb0c6c7a869.png)

> Kesimpulannya adalah tolak $H_0: \mu_X = \mu_Y$.

</ol>

### **Soal 2**

Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23500 kilometer dan standar devisi 3900 kilometer,

<ol type="a">
<li>

Apakah setuju dengan klaim tersebut?

</li>

$H_0: \mu \le 20000$

$H_1: \mu > 20000$

```r
library(BSDA)
mu <- 20000
n_x <- 100
mean_x <- 23500
s_x <- 3900

zsum.test(mean.x = mean_x, sigma.x = s_x, n.x = n_x,
          alternative = "greater", mu = mu, conf.level=0.95)

# alternative hypotesis: true mean is greater than 20000
```

![image](https://user-images.githubusercontent.com/54766683/207360738-5286683c-a562-4774-9401-979945d0065d.png)

> Setuju.

<li>

Jelaskan maksud dari output yang dihasilkan!

</li>

> Fungsi `zsum.test()` mengeluarkan hasil `alternative hypothesis: true mean is greater than 20000`, sehingga dapat disimpulkan tolak $H_0$.

<li>

Buatlah kesimpulan berdasarkan *$p$-value* yang dihasilkan!

</li>

> Nilai *$p$-value* yang dihasilkan kurang dari *significance level* $(2.2\times10^-16<0.05)$, sehingga dapat disimpulkan tolak $H_0$ dan benar bahwa mobil dikemudikan rata-rata lebih dari 20000 kilometer per tahun.

</ol>

### **Soal 3**

Diketahui perusahaan memiliki seroang data analyst yang ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkan data berikut dari perusahaan saham tersebut.

<div align=center>

| Atribut\Nama Kota      | Bandung | Bali    |
|:----------------------:|:-------:|:-------:|
| Jumlah Saham           | 19      | 27      |
| Mean Sampel            | 3.64    | 2.79    |
| Standar Deviasi Sampel | 1.67    | 1.32    |

</div>

Dari data di atas berilah keputusan serta kesimpulan yang didapatkan dari hasil di atas. Asumsikan nilai variansnya sama, apakah ada perbedaan pada rata-ratanya ($\alpha=5\%$)? Buatlah:

<ol type="a">
<li>

$H_0$ dan $H_1$

</li>

$H_0:\mu_1=\mu_2$

$H_1:\mu_1\ne\mu_2$

> $H_0:$ Tidak terdapat perbedaan antara rerata saham Kota Bandung $(\mu_1)$ dengan rerata saham Kota Bali $(\mu_2)$.

> $H_1:$ Terdapat perbedaan antara rerata saham Kota Bandung $(\mu_1)$ dengan rerata saham Kota Bali $(\mu_2)$.

<li>

Hitung sampel statistik

</li>

```r
# Soal 3
n_1 <- 19
n_2 <- 27
mean_1 <- 3.64
mean_2 <- 2.79
s_1 <- 1.67
s_2 <- 1.32

tsum.test(mean.x = mean_1, mean.y = mean_2, s.x = s_1, s.y = s_2,
          n.x = n_1, n.y = n_2, alternative="two.side",
          var.equal = TRUE, conf.level = 0.95)

# mean of x mean of y
#      3.64      2.79
```

![image](https://user-images.githubusercontent.com/54766683/207361359-68fc8252-22b2-49b9-87d3-dcd49c7b8830.png)

> $\mu_1\approx3.64$

> $\mu_2\approx2.79$

<li>

Lakukan uji statistik $(\text{df}=2)$

</li>

```r
tsum.test(mean.x = mean_1, mean.y = mean_2, s.x = s_1, s.y = s_2,
          n.x = n_1, n.y = n_2, alternative="two.side",
          var.equal = TRUE, conf.level = 0.95)

# t = 1.9267
# p-value = 0.06049
```

![image](https://user-images.githubusercontent.com/54766683/207364593-de5bf632-a35c-4814-aded-2eb41f3f1b69.png)

> $t=1.9267$

> $p\text{-value}=0.06049$

<li>

Nilai kritikal

</li>

```r
p_l <- qt(p = 0.025, df = 2, lower.tail = TRUE)
p_r <- qt(p = 0.025, df = 2, lower.tail = FALSE)
print(paste("nilai kritikal kiri: ", p_l, 
            "nilai kritikal kanan:", p_r))

# nilai kritikal kiri: -4.3027
# nilai kritikal kanan: 
```

![image](https://user-images.githubusercontent.com/54766683/207367244-59bd3c0e-c3a7-4d1f-a83d-b820c01db3da.png)

<li>

Keputusan

</li>

> Nilai $t$ berada pada rentang nilai kritikal dan *$p$-value* kurang dari *significance level* $(p\text{-value} < \alpha)$, sehingga terima $H_0$.

<li>

Kesimpulan

</li>

> Terima $H_0$, yaitu tidak terdapat perbedaan antara rerata saham Kota Bandung $(\mu_1)$ dengan rerata saham Kota Bali $(\mu_2)$.

</ol>

### **Soal 4**

Seorang peneliti sedang meneliti spesies dari kucing di ITS. Dalam penelititannya ia mengumpulkan data tiga spesies kucing yaitu kucing oranye, kucing hitam, dan kucing putih dengan panjangnya masing-masing.

Jika diketahui dataset sebagai berikut:

<div align=center>

| N\Group |  1   |  2   |  3   |
|:-------:|:----:|:----:|:----:|
| 1       | 19   | 18.3 | 18   |
| 2       | 18.6 | 17.9 | 18.6 |
| 3       | 18.3 | 17.6 | 18.3 |
| 4       | 18   | 17.3 | 18   |
| 5       | 18.2 | 17.5 | 18.2 |
| 6       | 18.6 | 17.9 | 18.2 |
| 7       | 18.5 | 17.8 | 18.5 |
| 8       | 18.2 | 17   | 18.2 |
| 9       | 18.4 | 17.7 | 19.2 |
| 10      | 18.9 | 18.2 | 18.5 |
| 11      | 19.9 | 19.2 | 19.9 |
| 12      | 18.5 | 17.8 | 18.5 |
| 13      | 16.9 | 16.2 | 16.9 |
| 14      | 18   | 17.3 | 18   |
| 15      | 17.3 | 16.6 | 17   |
| 16      | 17.8 | 17.1 | 17.2 |
| 17      | 20   | 19.3 | 20   |
| 18      | 19   | 18.3 | 19   |
| 19      | 19.2 | 18.5 | 19.2 |
| 20      | 18.9 | 18   | 18.9 |
| 21      | 17.5 | 16.8 | 17.5 |
| 22      | 18.1 | 17.2 | 18.1 |
| 23      | 18   | 17.3 | 18   |
| 24      | 18.1 | 17.4 | 18.1 |
| 25      | 17.4 | 16.7 | 17.4 |
| 26      | 17.9 | 17.2 | 17.9 |
| 27      | 17.4 | 16.7 | 17.4 |
| 28      | 16.7 | 16.2 | 16.5 |
| 29      | 19.7 | 19   | 19.7 |
| 30      | 19.3 | 18.6 | 19   |
| 31      | 19   | 18.3 | 19   |
| 32      | 19.4 | 18.7 | 19.7 |
| 33      | 19.8 | 19.1 | 19.8 |
| 34      | 19.3 | 18.6 | 19.3 |
| 35      | 18.5 | 17.8 | 17   |

</div>

Carilah:

<ol type="a">
<li>

Buatlah masing-masing jenis spesies menjadi 3 subjek "Grup" (grup 1, grup 2, dan grup 3)! Lalu gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

</li>

```r
data <- read.table("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt", h = T)

data$Group <- as.factor(data$Group)
data$Group <- factor(data$Group, labels = c("Kucing Oranye", "Kucing Hitam", "Kucing Putih"))

group1 = subset(data, Group == "Kucing Oranye")
group2 = subset(data, Group == "Kucing Hitam")
group3 = subset(data, Group == "Kucing Putih")
```

![image](https://user-images.githubusercontent.com/54766683/207371266-3e3c7921-8eb9-4c3c-b2b6-9e9a4e6d5ef8.png)

> Plot Kuantil Normal Group 1

```r
qqnorm(group1$Length)
qqline(group1$Length)
```

![image](https://user-images.githubusercontent.com/54766683/207371625-09fac567-9036-498c-9d99-254f2b27a5c0.png)

> Plot Kuantil Normal Group 2

```r
qqnorm(group2$Length)
qqline(group2$Length)
```

![image](https://user-images.githubusercontent.com/54766683/207371892-cc34062a-8c66-4cb5-8194-c39eae364438.png)

> Plot Kuantil Normal Group 3

```r
qqnorm(group3$Length)
qqline(group3$Length)
```

![image](https://user-images.githubusercontent.com/54766683/207371999-48f971fb-1c52-4012-bc26-04ecd8d55839.png)

<li>

Carilah atau periksalah *Homogenity of varinces*-nya! Berapa nilai $p$ yang didapatkan? Apa hipotesis dan kesimpulan yang dapat diambil?

</li>

```r
bartlett.test(Length~Group, data = data)
# p-value = 0.8054
```

![image](https://user-images.githubusercontent.com/54766683/207373551-7621f027-a936-4c75-9f15-79aef17e99bf.png)

> Nilai *$p$-value* lebih dari nilai *significance level* $(0.8054 > 0.05)$, sehingga asumsi varians dari ketiga kelompok sama dapat diterima (terdapat *homogenity of variance* untuk melakukan ANOVA)

<li>

Untuk uji ANOVA, buatlah model linier dengan panjang versus grup dan beri nama model tersebut model 1!

</li>

```r
model1 <- lm(Length~Group, data = data)
anova(model1)
```

![image](https://user-images.githubusercontent.com/54766683/207375447-ab4ecc81-625f-4b3a-b06f-a9c70db56e7d.png)

<li>

Dari hasil poin c, berapakah nilai $p$? Apa yang dapat disimpulkan dari $H_0$?

</li>

> Didapatkan nilai $p$ sebesar 0.0013, sehingga dapat disimpulkan untuk menolak $H_0$ karena nilai $p$ kurang dari *significance level* $(0.0013 < 0.05)$. Artinya, terdapat perbedaan rerata diantara tiga jenis kucing tersebut.

<li>

Verifikasilah jawaban model 1 dengan Post-hooc test TukeyHSD, dari nilai $p$ yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan!

</li>

```r
TukeyHSD(aov(model1))
```

![image](https://user-images.githubusercontent.com/54766683/207377378-0c39dc3f-2703-4d91-8e81-f6491bd8ea64.png)

<li>

Visualisasikan dengan ggplot2!

</li>

```r
library("ggplot2")
ggplot(data, aes(x = Group,y = Length)) +
  geom_boxplot(fill = c("orange", "black", "white"), color = "gray") +
  scale_x_discrete() + xlab("Group") + ylab("Length")
```

![image](https://user-images.githubusercontent.com/54766683/207379263-890baf65-991f-449a-846f-2be5b688f029.png)

</ol>

### **Soal 5**

Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi ($100\degree \text{C}$, $125\degree \text{C}$, dan $150\degree \text{C}$) dan tiga jenis kaca pelat muka (A, B, dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut.

<div align=center>

<table>
<tr>
<th>

**Suhu Operasi**

</th>
<th>

**Keluaran Cahaya**

</th>
</tr>
<tr>
<td>

| N\Pelat |  A  |  B  |  C  |
|:-------:|:---:|:---:|:---:|
| 1       | 100 | 100 | 100 |
| 2       | 100 | 100 | 100 |
| 3       | 100 | 100 | 100 |
| 4       | 125 | 125 | 125 |
| 5       | 125 | 125 | 125 |
| 6       | 125 | 125 | 125 |
| 7       | 150 | 150 | 150 |
| 8       | 150 | 150 | 150 |
| 9       | 150 | 150 | 150 |

</td>
<td>

| N\Pelat |  A   |  B   |  C   |
|:-------:|:----:|:----:|:----:|
| 1       | 580  | 550  | 546  |
| 2       | 568  | 530  | 575  |
| 3       | 570  | 579  | 599  |
| 4       | 1090 | 1070 | 1045 |
| 5       | 1087 | 1035 | 1053 |
| 6       | 1085 | 1000 | 1066 |
| 7       | 1392 | 1328 | 867  |
| 8       | 1380 | 1312 | 904  |
| 9       | 1386 | 1299 | 889  |

</td>
</tr>
</table>
</div>

Dengan data tersebut:

<ol type="a">
<li>

Buatlah plot sederhana untuk visualisasi data!

</li>

```r
setwd("F:\\PROJECT\\probstat\\Modul2_Probstat_5025211045")
data <- read.csv(file = "GTL.csv")

qplot(x = Temp, y = Light, geom = "point", data = data) +
  facet_grid(.~Glass, labeller = label_both)
```

![image](https://user-images.githubusercontent.com/54766683/207382602-027d814c-740a-4f87-b792-09db13b09b19.png)

<li>

Lakukan uji ANOVA dua arah untuk 2 faktor!

</li>

```r
data$Glass <- as.factor(data$Glass)
data$Temp <- as.factor(data$Temp)

anova <- aov(Light~Glass*Temp, data = data)
summary(anova)
```

![image](https://user-images.githubusercontent.com/54766683/207383324-f992ad9d-352a-4fdc-892c-053c51f05d09.png)

<li>

Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dn suhu operasi)!

</li>

```r
library("magrittr")
library("dplyr")
summary <- group_by(data, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
print(summary)
```

![image](https://user-images.githubusercontent.com/54766683/207384287-e4f44ac6-d5c4-46ea-bd82-cc23e31fb5d8.png)

<li>

Lakukan uji Turkey!

</li>

```r
tukey <- TukeyHSD(anova)
print(tukey)
```

![image](https://user-images.githubusercontent.com/54766683/207386639-b14abb21-4b7e-4301-899d-3b419855e3f0.png)

![image](https://user-images.githubusercontent.com/54766683/207386848-1194f81c-3a70-495b-895c-e9be67f8ad75.png)

<li>

Gunakan *compact letter display* untuk menunjukkan perbedaan signifikan antara uji ANOVA dan uji Turkey!

</li>

```r
library("multcompView")
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
summary$Tukey <- cld$Letters
print(summary)
```

![image](https://user-images.githubusercontent.com/54766683/207385733-809ac1e6-17c5-4174-9ad4-d660d94070ae.png)

![image](https://user-images.githubusercontent.com/54766683/207385872-5baaf43e-63bc-4b5c-836d-a19310ea3e3f.png)

<ol>

</div>
