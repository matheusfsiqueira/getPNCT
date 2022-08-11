# getPNCT - Download PNCT traffic data using R
getPNCT is an R wrapper for downloading PNCT traffic data from DNIT's Web API (Departamento Nacional de Infraestrutura de Transportes). PNCT - Plano Nacional de Contagens de Tráfego - consists of a national program of continuous traffic counts on federal highways, and is considered one of the main data sources on traffic on Brazilian rural highways.

The PNCT website [(here)](http://servicos.dnit.gov.br/dadospnct/ContagemContinua) offers a number of interesting visualizations on the traffic data collected at different locations, such as AADT, MADT, seasonality factors and K-factors, which are very useful for traffic studies. However, there is a difficulty in obtaining the raw data, or obtaining data for several years/locations; these limitations are overcome by using getPNCT, which offers a simple and easy alternative to obtain PNCT data with a few lines of code.

<b>Português: </b> getPNCT é um pacote R para download de dados de tráfego PNCT usando a API do DNIT (Departamento Nacional de Infraestrutura de Transportes). PNCT - Plano Nacional de Contagens de Tráfego - consiste em um programa nacional de contagem contínua de tráfego nas rodovias federais, e é considerado uma das principais fontes de dados sobre o tráfego nas rodovias rurais brasileiras.

O website do PNCT [(aqui)](http://servicos.dnit.gov.br/dadospnct/ContagemContinua) oferece uma série de visualizações interessantes sobre os dados de tráfego coletados em diferentes locais, tais como VDMa, VDMm, fatores de sazonalidade e fatores K, que são muito úteis para estudos de tráfego. Entretanto, há uma dificuldade na obtenção dos dados brutos, ou na obtenção de dados de vários anos/locais; estas limitações são superadas pelo uso de getPNCT, que oferece uma alternativa simples e fácil para obter dados PNCT com algumas linhas de código.

## Installation in R
``` R
# install.packages("devtools")
devtools::install_github("matheusfsiqueira/getPNCT")
  library(getPNCT)
```
## Usage
The package is very simple to use. See exemples below.

### First, get data on count locations
```r
equipamentos <- get_PNCT_sites(year="all",
			       geo = FALSE) # TRUE to output a sf object (spatial object)
```
Function outputs a data frame or sf object regarding PNCT count locations, with information on location, highway, geographic coordinates and available data. 
Attribute "idEquipamento" is the id variable that will be used in the following functions. Also, you should verify, for the desired count location(s), which years have count data.

### Get AADT traffic data / Obter dados de VDMa
```r
process <- get_VDMA(id = 414,
                    year="all")
```
Output is a data frame contaning info on AADT for the equipment selected using "id".

### Get MADT traffic data / Obter dados de VDMm
```r
process <- get_VDMM(id = 414,
                    year="all")
```
Output is a data frame contaning info on MADT for the equipment selected using "id".

### Get WADT traffic data / Obter dados de VDMs
Unlike the previous functions, in this one you need to specify the filter year for the data.
```r
process <- get_VDMS(id = 414,
                    year=2018)
```
Output is a data frame contaning info on WADT for the equipment selected using "id".

### Get average traffic data by day of the week / Obter dados de volume médio por dia da semana
In this function, you need to specify the filter year for the data.
```r
process <- get_VDMD(id = 414,
                    year=2018)
```
Output is a data frame contaning info on average traffic per day of the week for the equipment selected using "id".

### Get daily traffic data (raw volumes) / Obter dados de tráfego diários (dados brutos diários)
```r
process <- get_VD(id = 414,
                  year="all")
```
Output is a data frame contaning info on daily traffic volumes for the equipment selected using "id". This "raw" data is the basis for obtaining the AADT estimates, and other aggregate measures shown in the previous functions.

### Get hourly traffic data (raw volumes) / Obter dados de tráfego horários (dados brutos horários)
You need to specify a date, by setting "year","month" and "day" arguments (integer format).
```r
process <- get_VH(id = 414,
                  year=2018,
                  month=1,
                  day=1)
```
Output is a data frame contaning info on hourly traffic volumes for the equipment selected using "id".

### Get K-factors / Obter fatores K
In this function, you need to specify the filter year for the data.
```r
process <- get_K_factor(id = 414,
                        year=2018)
```
Output is a data frame contaning K factors for the first 500 hours, for the equipment selected using "id".

### Get seasonal factors / Obter fatores de sazonalidade
In this function, you need to specify the filter year for the data, as well as the type of seasonal factor desired. <b> Currently, this function does not appear to be working properly in the DNIT API </b>
```r
process <- get_seasonal_factor(id = 414,
                              year=2018,
                              type="month") #one of "month","week","weekday"
```
Output is a data frame contaning seasonal factors for the equipment selected using "id".

## Notes
- Output traffic data is usually segmented by vehicle types, using PNCT codes:

| Código/Code | Tipo de Veículo | Vehicle Type |
|--|--|--|
| A | Ônibus/Cam de 2 eixos | Buses/2-Axle Trucks |
| B | Ônibus/Cam de 3 eixos | Buses/3-Axle Trucks |
| C | Caminhão de 4 eixos | Buses/4-Axle Trucks |
| D | Caminhão de 5 eixos  | 5-Axle Trucks |
| E | Caminhão de 6 eixos  | 6-Axle Trucks |
| F | Caminhão de 7 eixos  | 7-Axle Trucks |
| G | Caminhão de 8 eixos  | 8-Axle Trucks |
| H | Caminhão de 9 eixos  | 9-Axle Trucks |
| I | Passeio | Passenger Car |
| J | Moto | Motorcycle |
| L | Outros | Other |

- Weekdays in function `get_VDMD` are coded as 1 = sunday (domingo) and 7 = saturday (sábado)
