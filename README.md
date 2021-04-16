# javanese_date_converter

A plugin to convert general calendar (*Gregorian* Calendar) to *Javanese* Calendar for Dart.

## Overview
Indonesia is a country that has a variety of cultures and beliefs.  Not only those, they also has their own local calendar.  One of them come from Javanese ethnic, **Javanese Calendar**.  It began to used in Java island since 1625 when Mataram Kingdom was led by Sultan Agung.  Generally, the usage is as a basic to count good or bad days, divinatory systems, celebrations, and rites of passage as birth or death.

##  Getting Started
### Dependency
Add `javanese_date_converter` package as dependency in `pubspec.yaml`
```yaml
dependencies:
  javanese_date_converter: ^0.0.1
```
### Import
Import `javanese_date_converter` to you Dart file
```dart
import 'package:javanese_date_converter/javanese_date_converter';
```

## How to Use
### Initialization
```dart
JavaneseDate javaneseDate = JavaneseDate(day: 27, month: 7, year: 1999)
```
or you can use `DateTime` with this way:
```dart
JavaneseDate javaneseDate = JavaneseDate.fromDateTime(DateTime.now());
```
### Feature
##### Dinapitu
Dinapitu is seven-day wuku cycle corresponds to day names in Gregorian.
It consists of *Sênèn*, *Selasa*, *Rêbo*, *Kêmis*, *Jemuwah*, *Sêtu*, and *Ngahad*.
```dart
String dinapitu = javaneseDate.dinapitu;
```
##### Pasaran
Pasaran is five-day cycle consists of *Pon*, *Wage*, *Kliwon*, *Lêgi*, *Pahing*.
```dart
String pasaran = javaneseDate.pasaran;
```
##### Wetonan
Wetonan is the combination of five-day *pancawara* cycle with the seven-day *wuku* week cycle.
```dart
String weton = javaneseDate.wetonan.weton;
int neptu = javaneseDate.wetonan.neptu;
```

## Reference
[Karjanto, N. and F. Beauducel. “An ethnoarithmetic excursion into the Javanese calendar.” (2020).](https://arxiv.org/pdf/2012.10064.pdf "An ethnoarithmetic excursion into the Javanese calendar")