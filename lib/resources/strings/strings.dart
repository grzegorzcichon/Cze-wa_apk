class Str {
  static const Label label = Label();

  static const Buttons buttons = Buttons();
  static const Errors errors = Errors();
}

class Label {
  const Label();
  final String welcome = "Poznaj Częstochowę";
  final String sendanemail = 'Wyślij wiadomosć email';
  final String deviceinfo = 'Informacje o urządzeniu';
  final String chosedistricts = "Która dzielnica Cię interesuje";
  final String districtname = "Nazwa dzielnicy: ";
  final String districtpopulation = "Liczba mieszkańców: ";
  final String disttrictpageinfo =
      "kliknij w zdjęcie aby dowiedzieć się więcjej o danej dzielnicy.";
  final String airconditioninform = "Informacje o stanie powietrza";
  final String airconditioninfo =
      "Dane pobierane są z bazy danych gios.gov.pl. Uśrednione dane są publikowane co 1h. Gdy któraś z wartości przyjmuje wartość '0', ozbacza to że dane nie zostały dostarcozne do gios, lub nie zostały jeszcze uaktualnione. Taki stan trwa około 15-20 min ";
  final String airconditioninfoclose =
      "Użyj ikony po prawej stronie do zamknięcia tego powiadomienia";
  final String airconditioninfoimage = "Kliknij w zdjęcie aby je powiększyć";
  final String airconditionunit = ' μg/m3';
  final String covalue = "Tlenek węgla [CO]: ";
  final String no2value = "Dwutlenek azotu [NO2]: ";
  final String o3value = "Ozon [O3]: ";
  final String pm10value = "Pył zawieszonny [PM10]: ";
  final String so2value = "Dwutlenek siarki [SO2]: ";
  final String c6h6value = "Benzen [C6H6]: ";
  final String aboutdata =
      "Polski indeks jakości powietrza, jest obliczany wyłącznie na podstawie 1-godzinnych danych niezweryfikowanych ze stacji automatycznych funkcjonujących w ramach Państwowego Monitoringu Środowiska (PMŚ). Polski indeks jakości powietrza liczony jest bezpośrednio w bazie danych jakości powietrza JPOAT2,0 Głównego Inspektoratu Ochrony Środowiska na podstawie danych otrzymanych ze stacji pomiarowych PMŚ za pośrednictwem baz danych wojewódzkich inspektoratów ochrony środowiska. Polski indeks jakości powietrza liczony jest na podstawie 1-godzinnych wyników z pomiarów stężeń w powietrzu: dwutlenku siarki (SO2), dwutlenku azotu (NO2), pyłu PM10, pyłu PM2,5, tlenku węgla (CO), benzenu (C6H6), ozonu (O3). Indeksy jakości powietrza dla poszczególnych zanieczyszczeń liczone są na podstawie 1-godzinnych stężeń tych zanieczyszczeń (tylko ze stanowisk automatycznych). W przypadku indeksu indywidualnego przy braku dostatecznej informacji pomiarowej do obliczenia indeksu dany punkt nie wyświetla się. Wartość polskiego indeksu jakości powietrza liczona jest z powyższej tabeli zakresów (średnie 1-godzinne), gdzie liczone są indeksy indywidualne dla poszczególnych zanieczyszczeń przez porównanie pomierzonej wartości zanieczyszczenia z zadanymi wartościami progowymi. Następnie indeks ogólny przyjmuje wartość najgorszego indeksu indywidualnego dla danego zanieczyszczenia. Przed porównaniem z granicami przedziałów dla poszczególnych klas indeksu, wartości są zaokrąglone do liczb całkowitych, zgodnie z zasadami matematycznymi.   ";
  final String deviceinformationappbar = "Informacje o telefonie";
  final String deviceinfoIP = 'Adres IP: ';
  final String devicephone = 'Nazwa telefonu: ';
  final String deviceosversion = 'Wersja systemu: ';
  final String deviceosname = 'System operacyjny: ';
  final String devicescreenresolution = 'Rozdzielczość ekranu: ';
  final String devicebrand = 'Marka: ';
}

class Buttons {
  const Buttons();
  final String aircondition = "Jakość powietrza w Częstochowie";
  final String gotoczestochowadustrict = "Poznaj dzielnicę Częstochowy";
  final String gotowatherforecast = "Sprawdż pronozę pogody";
  final String reloaddata = "Odśwież dane";
  final String close = "zamknij";
}

class Errors {
  const Errors();
  final String districtserror =
      "Podczas wczytywania danych wystąpił błąd. Wciśnij przycisk aby odświeżyć dane ";
}
