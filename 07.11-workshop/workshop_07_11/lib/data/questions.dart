import 'package:workshop_07_11/models/question_model.dart';

var questions = [
  QuestionModel(
      "Flutter'da Stateful Widget ile Stateles Widget arasındaki temel fark nedir?",
      [
        "Stateful Widget, iç durumunu değiştirebilir; Stateles Widget ise durumu değiştiremez.",
        "Stateful Widget, yapılarını oluşturmak için initState() fonksiyonunu kullanır; Stateles Widget bunu kullanmaz.",
        "Stateful Widget, setState() metodunu kullanarak iç durumu günceller; Stateles Widget bu özelliği barındırmaz.",
        "Stateful Widget, build() fonksiyonunu kullanarak arayüzü oluşturur; Stateles Widget ise initState() fonksiyonunu kullanır."
      ],
      "Stateful Widget, iç durumunu değiştirebilir; Stateles Widget ise durumu değiştiremez.",
      false),
  QuestionModel(
      "Flutter'da Hot Reload özelliği nedir?",
      [
        "Kodu değiştirdiğinizde, uygulamanın tamamen yeniden başlamasını sağlayan bir özellik.",
        "Uygulama üzerinde yapılan değişikliklerin anında görsel olarak uygulamaya yansıtılmasını sağlayan bir özellik.",
        "Sadece belirli bir bölümünü güncellemek için kodu yeniden yüklemenizi sağlayan bir özellik.",
        "Uygulama hatalarını düzeltmek için kullanılan özel bir geliştirici aracı."
      ],
      "Uygulama üzerinde yapılan değişikliklerin anında görsel olarak uygulamaya yansıtılmasını sağlayan bir özellik.",
      false),
  QuestionModel(
      "Flutter'da Pubspec.yaml dosyası ne işe yarar?",
      [
        "Proje için temel yapılandırmayı belirler ve harici paketleri yönetir.",
        "Uygulamanın ikonlarını ve görünümünü belirlemek için kullanılır.",
        "Sadece uygulamanın sürüm numarasını içerir.",
        "Kodun düzenini ve biçimlendirmesini belirleyen bir dosyadır."
      ],
      "Proje için temel yapılandırmayı belirler ve harici paketleri yönetir.",
      false),
  QuestionModel(
      "Flutter'da Widget ve Element arasındaki fark nedir?",
      [
        "Widget, arayüzdeki görsel öğeleri temsil ederken, Element bu öğelerin konumunu belirler.",
        "Widget, kullanıcı etkileşimini algılar; Element ise arayüzü oluşturur.",
        "Widget, kullanıcı arabirimi parçalarını oluştururken, Element bu parçaların konumlarını belirler.",
        "Widget, uygulamanın işlevselliğini sağlar; Element ise uygulamanın görsel yapısını temsil eder."
      ],
      "Widget, kullanıcı arabirimi parçalarını oluştururken, Element bu parçaların konumlarını belirler.",
      false),
  QuestionModel(
      "Flutter'da BuildContext neyi temsil eder?",
      [
        "Uygulamanın genel yapılandırmasını sağlar.",
        "Arayüzdeki herhangi bir öğenin konumunu belirler.",
        "Widget ağacındaki konumu ve hiyerarşiyi temsil eder.",
        "Sadece uygulama boyunca kullanılabilen bir değişken türüdür."
      ],
      "Widget ağacındaki konumu ve hiyerarşiyi temsil eder.",
      false),
  QuestionModel(
      "Flutter'da Navigator hangi amaçla kullanılır?",
      [
        "Farklı ekranlar arasında geçiş yapmak ve gezinme işlevselliği sağlamak için kullanılır.",
        "Animasyon efektlerini uygulamak için kullanılır.",
        "Yalnızca geri butonu işlevselliğini sağlar.",
        "Widget'ların özelliklerini değiştirmek için kullanılır."
      ],
      "Farklı ekranlar arasında geçiş yapmak ve gezinme işlevselliği sağlamak için kullanılır.",
      false),
  QuestionModel(
      "Flutter'da Scaffold widget'ı ne işe yarar?",
      [
        "Uygulamanın genel temasını ve renklerini belirlemek için kullanılır.",
        "Sayfa düzenini ve genel görünümü oluşturmak için kullanılır.",
        "Yalnızca metin girişi alanları için kullanılır.",
        "Widget'ların konumunu belirlemek için kullanılır."
      ],
      "Sayfa düzenini ve genel görünümü oluşturmak için kullanılır.",
      false),
  QuestionModel(
      "Flutter'da setState fonksiyonu neden kullanılır?",
      [
        "Widget'ın durumunu güncellemek ve bu durum değişikliğini ekrana yansıtmak için kullanılır.",
        "Widget'ların boyutunu ve şeklini değiştirmek için kullanılır.",
        "Sadece arka planda veri işleme için kullanılır.",
        "Ekranın dili ve bölgesel ayarlarını değiştirmek için kullanılır."
      ],
      "Widget'ın durumunu güncellemek ve bu durum değişikliğini ekrana yansıtmak için kullanılır.",
      false),
  QuestionModel(
      "Flutter'da ListView ile GridView arasındaki fark nedir?",
      [
        "ListView, yalnızca yatay düzlemde kaydırma yapılmasını sağlar; GridView ise dikey düzlemde kaydırmaya olanak tanır.",
        "ListView, elemanları yalnızca dikey olarak sıralar; GridView ise hem yatay hem de dikey düzlemde elemanları gösterir.",
        "ListView, elemanları ızgara şeklinde gösterir; GridView ise elemanları düz bir çizgi halinde sıralar.",
        "ListView, elemanları ızgara şeklinde gösterir; GridView ise yalnızca dikey olarak elemanları sıralar."
      ],
      "ListView, elemanları yalnızca dikey olarak sıralar; GridView ise hem yatay hem de dikey düzlemde elemanları gösterir.",
      false),
  QuestionModel(
      "Flutter'da InkWell widget'ı ne işe yarar?",
      [
        "Yalnızca metin alanları için kullanılır.",
        "Dokunma algılama özelliği olan bir widget'tır.",
        "Yalnızca görüntüleri görüntülemek için kullanılır.",
        "Yalnızca animasyon efektleri eklemek için kullanılır."
      ],
      "Dokunma algılama özelliği olan bir widget'tır.",
      false),
];
