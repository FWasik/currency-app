# currency_app

currency_app is an mobile application which displays latest rates of selected currency to PLN. There are two available currency to choose: USD and EUR. Rates are the average rates of the last 30 days. Rates are provided from [NBP_API](http://api.nbp.pl/). 

App was created in Flutter framework and Bloc package. Also, app is based on Clean Architeture. 


## Technologies, packages and APIs

* [Flutter](https://flutter.dev/)
* [Bloc](https://pub.dev/packages/flutter_bloc)
* [syncfusion_flutter_charts](https://pub.dev/packages/syncfusion_flutter_charts)
* [NBP_API](http://api.nbp.pl/)


## Overview

First of all, let's take a look at project tree:

![project_tree](assets/readme/project_tree.png)


As mentiond, app is based on Clean Architeture pattern thus app is divided into, firstly, features. Here we have only one which is "currency". Furthermore, "currency" is divided into 3 folders, "data", "domain" and "presentation" which describe each layer of application. "Data" has 3 inner folders: "datasource" with "currency_rate_data_source.dart" file whose task is to get data from API and "models" and "repositories" which implement or extend classes from "domain" layer and folder, accordinally, "entities" and "repositories". Body of "currency_rate_data_source.dart":

![data_source_code](assets/readme/data_source_code.png)



