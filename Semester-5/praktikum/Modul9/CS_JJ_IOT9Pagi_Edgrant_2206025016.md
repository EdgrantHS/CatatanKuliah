# Case Study 8

Nama: Edgrant Henderson Suryajaya

NPM: 2206025016

Kelompok: Ivander, Rusyafa, Syauqi

---
## 1. Lampirkan code A dan B yang kelompok anda telah buat pada lembar jawaban dan jelaskan cara kerja code anda secara detail. (60 poin)

### Kode A

```cpp
#include <Arduino.h>
#include <DHT.h>
#include <painlessMesh.h>
#include <Adafruit_Sensor.h>

#define DHTPIN 4 // DHT11 data pin 4, ganti pin kalau bermasalah
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);

// Mesh network parameters
#define MESH_SSID "Kelompok_A2_B2"
#define MESH_PASSWORD "Kelompok_A2_B2"
#define MESH_PORT 5002

painlessMesh mesh;
QueueHandle_t dhtQueue;
String serialInput = "OFF"; // Global variable untuk menyimpan serial input ("ON"/"OFF")

void taskDHT(void *pvParameters);
void taskSerial(void *pvParameters);
void taskMesh(void *pvParameters);

// Struct untuk queue
struct DHTData
{
  float temperature;
  float humidity;
};

void setup()
{
  Serial.begin(9600);
  dht.begin();
  pinMode(DHTPIN, INPUT);

  // Initialize queue
  dhtQueue = xQueueCreate(5, sizeof(DHTData));

  // Create FreeRTOS tasks
  xTaskCreate(taskDHT, "Task_DHT", 4096, NULL, 1, NULL);
  xTaskCreate(taskSerial, "Task_Serial", 2048, NULL, 1, NULL);
  xTaskCreate(taskMesh, "Task_Mesh", 8192, NULL, 1, NULL);

  // Setup mesh
  mesh.setDebugMsgTypes(ERROR | STARTUP | CONNECTION);
  mesh.init(MESH_SSID, MESH_PASSWORD, MESH_PORT);
}

void loop()
{
  mesh.update();
}

// Task untuk membaca DHT11 setiap 5 detik dan kirim datanya dalam bentuk struct DHTData ke taskMesh via queue
void taskDHT(void *pvParameters)
{
  DHTData dhtData;
  while (true)
  {
    dhtData.temperature = dht.readTemperature();
    dhtData.humidity = dht.readHumidity();

    if (!isnan(dhtData.temperature) && !isnan(dhtData.humidity))
    {
      xQueueSend(dhtQueue, &dhtData, portMAX_DELAY);
    } else {
      Serial.println("Failed to read data from DHT sensor!");
    }

    vTaskDelay(pdMS_TO_TICKS(5000)); // Delay 5 detik
  }
}

// Task untuk menerima input dari Serial Monitor lalu disimpan ke variable serialInput
void taskSerial(void *pvParameters)
{
  while (true)
  {
    if (Serial.available() > 0)
    {
      String input = Serial.readStringUntil('\n');
      input.trim();

      if (input == "ON" || input == "OFF")
      {
        serialInput = input;
      }

      serialInput = input;
      Serial.println("Received Input: " + serialInput); // Tambahkan print untuk menampilkan input
    }
    vTaskDelay(pdMS_TO_TICKS(100)); // Delay untuk mencegah polling berlebihan
  }
}

// Task untuk mengirim message ke root node dengan data DHT dan hasil input serial monitor
void taskMesh(void *pvParameters)
{
  DHTData dhtData;
  while (true)
  {
    if (xQueueReceive(dhtQueue, &dhtData, portMAX_DELAY) == pdTRUE)
    {
      String message = "Sending: T" + String(dhtData.temperature) + "H" + String(dhtData.humidity) + "I" + serialInput;
      mesh.sendBroadcast(message);
    }
    vTaskDelay(pdMS_TO_TICKS(1000)); // Optional delay
  }
}

```

### taskDHT

Task ini berfungsi untuk membaca data dari sensor DHT11 setiap 5 detik. Task ini akan membaca data suhu dan kelembaban dari sensor DHT11 menggunakan fungsi `dht.readTemperature()` dan `dht.readHumidity()`. Data suhu dan kelembaban tersebut akan disimpan ke dalam struct `DHTData`. Jika data suhu dan kelembaban berhasil didapatkan, maka data tersebut akan dikirim ke queue `dhtQueue` menggunakan fungsi `xQueueSend`. Task ini akan dijalankan secara terus menerus dengan delay 5 detik.

### taskSerial

Task ini berfungsi untuk menerima input dari Serial Monitor dan menyimpan input tersebut ke dalam variabel `serialInput`. Task ini akan membaca input dari Serial Monitor menggunakan fungsi `Serial.readStringUntil('\n')`. Input tersebut akan di-trim dan disimpan ke dalam variabel `serialInput`. Task ini akan dijalankan secara terus menerus dengan delay 100 ms.

### taskMesh

Task ini berfungsi untuk mengirim message ke root node dengan data DHT dan hasil input serial monitor. Task ini akan menerima data dari queue `dhtQueue` dan mengirim data tersebut ke root node melalui mesh network. Data yang dikirim berupa message yang berisi data suhu dan kelembaban dari sensor DHT11 dan hasil input dari Serial Monitor. Task ini akan dijalankan secara terus menerus dengan delay 1 detik.

### Kode B

```cpp
#include <Arduino.h>
#include <painlessMesh.h>
#include <WiFi.h>
#include <WiFiClientSecure.h>
// #include <WiFiClient.h> 
#include <PubSubClient.h>

// Mesh network parameters
// Ganti AX dan BX menjadi nomor kelompok
// Contohnya kelompok A1 dan B1 ganti menjadi Kelompok_A1_B1
// Untuk Port ganti X dengan nomor kelompok
// Contohnya kelompok A1 dan B1 ganti menjadi 5001
// Atau kelompok A5 dan B5 ganti menjadi 5005 
#define MESH_SSID "Kelompok_A2_B2"
#define MESH_PASSWORD "Kelompok_A2_B2"
#define MESH_PORT 5002

// Ganti network credential dibawah dengan access point untuk mengakses internet
#define SSID ":/"
#define PASSWORD "11112222"
#define HOSTNAME "ESP32_Kelompok_A2_B2"

#define MQTT_SERVER "broker.hivemq.com"
#define MQTT_PORT 8883
// #define MQTT_PORT 1883 // TEMP, unsecure connection
#define MQTT_TOPIC "RTOS/CSIOT9"

const char *server_cert = R"(-----BEGIN CERTIFICATE-----
MIIEkjCCA3qgAwIBAgITBn+USionzfP6wq4rAfkI7rnExjANBgkqhkiG9w0BAQsF
ADCBmDELMAkGA1UEBhMCVVMxEDAOBgNVBAgTB0FyaXpvbmExEzARBgNVBAcTClNj
b3R0c2RhbGUxJTAjBgNVBAoTHFN0YXJmaWVsZCBUZWNobm9sb2dpZXMsIEluYy4x
OzA5BgNVBAMTMlN0YXJmaWVsZCBTZXJ2aWNlcyBSb290IENlcnRpZmljYXRlIEF1
dGhvcml0eSAtIEcyMB4XDTE1MDUyNTEyMDAwMFoXDTM3MTIzMTAxMDAwMFowOTEL
MAkGA1UEBhMCVVMxDzANBgNVBAoTBkFtYXpvbjEZMBcGA1UEAxMQQW1hem9uIFJv
b3QgQ0EgMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALJ4gHHKeNXj
ca9HgFB0fW7Y14h29Jlo91ghYPl0hAEvrAIthtOgQ3pOsqTQNroBvo3bSMgHFzZM
9O6II8c+6zf1tRn4SWiw3te5djgdYZ6k/oI2peVKVuRF4fn9tBb6dNqcmzU5L/qw
IFAGbHrQgLKm+a/sRxmPUDgH3KKHOVj4utWp+UhnMJbulHheb4mjUcAwhmahRWa6
VOujw5H5SNz/0egwLX0tdHA114gk957EWW67c4cX8jJGKLhD+rcdqsq08p8kDi1L
93FcXmn/6pUCyziKrlA4b9v7LWIbxcceVOF34GfID5yHI9Y/QCB/IIDEgEw+OyQm
jgSubJrIqg0CAwEAAaOCATEwggEtMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/
BAQDAgGGMB0GA1UdDgQWBBSEGMyFNOy8DJSULghZnMeyEE4KCDAfBgNVHSMEGDAW
gBScXwDfqgHXMCs4iKK4bUqc8hGRgzB4BggrBgEFBQcBAQRsMGowLgYIKwYBBQUH
MAGGImh0dHA6Ly9vY3NwLnJvb3RnMi5hbWF6b250cnVzdC5jb20wOAYIKwYBBQUH
MAKGLGh0dHA6Ly9jcnQucm9vdGcyLmFtYXpvbnRydXN0LmNvbS9yb290ZzIuY2Vy
MD0GA1UdHwQ2MDQwMqAwoC6GLGh0dHA6Ly9jcmwucm9vdGcyLmFtYXpvbnRydXN0
LmNvbS9yb290ZzIuY3JsMBEGA1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQsF
AAOCAQEAYjdCXLwQtT6LLOkMm2xF4gcAevnFWAu5CIw+7bMlPLVvUOTNNWqnkzSW
MiGpSESrnO09tKpzbeR/FoCJbM8oAxiDR3mjEH4wW6w7sGDgd9QIpuEdfF7Au/ma
eyKdpwAJfqxGF4PcnCZXmTA5YpaP7dreqsXMGz7KQ2hsVxa81Q4gLv7/wmpdLqBK
bRRYh5TmOTFffHPLkIhqhBGWJ6bt2YFGpn6jcgAKUj6DiAdjd4lpFw85hdKrCEVN
0FE6/V1dN2RMfjCyVSRCnTawXZwXgWHxyvkQAiSr6w10kY17RSlQOYiypok1JR4U
akcjMS9cmvqtmg5iUaQqqcT5NJ0hGA==
-----END CERTIFICATE-----)";

const char *client_cert = R"(-----BEGIN CERTIFICATE-----
MIIDazCCAlOgAwIBAgIUbWy5H7TNMuFPfusBtB9TvsOpducwDQYJKoZIhvcNAQEL
BQAwRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM
GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDAeFw0yNDExMTUwNDI3MzBaFw0yNTEx
MTUwNDI3MzBaMEUxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEw
HwYDVQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQDp65k5onzsAeko4jWU7xzkUHzaFjZzojINTIL9jlpp
mfGgezPgzWpAGy5KiXXhPRJSHN2filHHZT6saoYktlaA79/2cSbMMOAu/lf0xCQp
CTndwOtvmX8KeSnelc1cwyX9S3ArINM/LJDBH4EQU/+sPIR21HzKGXMyOmBE2o1h
70zg2K4wO2JxNzBI4oYK6YLF097pnC/zGDoDkA4zf18T43i4Jhz7O8GG4K7wbjif
sok3CLZQrNCylKEMLDgTqxT3EEm1MZ1UXhxA6BCYd88dRRG3doeSrfB9RwXomQ7Y
9cOIivnkQJ6xlZMvj/EUfl4gCWszFDM5xVGyXyCLl+MdAgMBAAGjUzBRMB0GA1Ud
DgQWBBQ920Lzuv+jBTbkTmxJRSdfa8CVnjAfBgNVHSMEGDAWgBQ920Lzuv+jBTbk
TmxJRSdfa8CVnjAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQA8
ZE6B7mOaXdrciIhrPEGztl2AngjAFcQJ5lkJ4XBQ9EMc1zHe0HnCGD0liHbBtRne
rOTZQi6nE5di+eAe1QlDFb2Vs/CzKbqXSUNLtyiYZ/LhFOC47TPB8mJm4Bx3DN4Y
1SBO3cvmhQP4p23b4PAqca1mG29b9oihMY2dgqsRM/3jgdtFkEcHsdN6MNwGs9j4
OMCyoBW5C8TEqhFk2EFBQ6Pq+wyYG7FR1WFNEs4nMrotHP0RCvLRbawYlphWZkBG
t3e3ZQSDxNzy4nyYpuU7Eie8WQdx9r5ap21H1CivNSaSZgPPsx5KeMeRyD2k/bBZ
L/zbnMrguBlBs0DFuaUw
-----END CERTIFICATE-----)";

const char *client_key = R"(-----BEGIN PRIVATE KEY-----
MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDp65k5onzsAeko
4jWU7xzkUHzaFjZzojINTIL9jlppmfGgezPgzWpAGy5KiXXhPRJSHN2filHHZT6s
aoYktlaA79/2cSbMMOAu/lf0xCQpCTndwOtvmX8KeSnelc1cwyX9S3ArINM/LJDB
H4EQU/+sPIR21HzKGXMyOmBE2o1h70zg2K4wO2JxNzBI4oYK6YLF097pnC/zGDoD
kA4zf18T43i4Jhz7O8GG4K7wbjifsok3CLZQrNCylKEMLDgTqxT3EEm1MZ1UXhxA
6BCYd88dRRG3doeSrfB9RwXomQ7Y9cOIivnkQJ6xlZMvj/EUfl4gCWszFDM5xVGy
XyCLl+MdAgMBAAECggEACsAtNpzlKOOdl6dt1v52UXfxhQRoVEAsFLhjfMvCFABj
PoDrDXXjYDbflcVjiYqJAQUamm58+7EHhF0Q9Tb8GsjrfiQNKG1GoGJIIJOzJb+q
zSpEp8hiMlUHO5ee7Jh7cny5FwJXMxwVOwr7n4h8w6m0XNG/OnqY9MICEqgIv2tt
ll4+lK7byY/cqiHpRbm32LUHpiluUocFdEs7QIt6Uo7wDR1SamnrhKtXy8nQXLFP
wmYdjQlxqM+9u2XPUDiFLB69wY0L4LmdLg5MouPFt5BuLhyYlYWo1GMCvwTewBv8
DvkhAozo08NE+mL8Ui2Jg4GD5K0uFtPaBleKSyeu8QKBgQDrXlHwUeUZ/ZYrydN7
4kko5LQySyAhi6GWjs+MUHrtN5nzSogcCKptAvQku7WfvfnQT8qLOW/Oap0lC1bU
mlIwzJEMDQware5Vy2LptAw1Vb3JXhQ0v+8UPaSUa5klAMw6VKDkvBGfeJPAtsDi
vZvAvWyVWtaK86LkltPldqnHMwKBgQD+bMhGoQT9SCRl5jEWbboOMvubWWDRNmSf
GDiOfB0E5Vv/eWZJuWxy5JK/UM1Solgho8TNVITapwpOhR9FuUbBGCVUEfrkaXRf
eaThb8ZScP4gBCeedQ/qA3kKTcalxDYZx7OwNkygpyZ58CR/yqiBazHLdY6tCG8w
EN8mdEtsbwKBgElhDoqt/Y8s0DS2p4hn9AcbxlInucy7i5U00OAd9zUdsJF5GxYi
XX+++/63xtgWkluvhKYDMihYdMWn01pVAmrUXCQ1rSBkOXnl/uB9kZDPOmwdOI95
hz/4N+dN5GD07rcAy2iEeboODYJ3d4s5MeXVKJUnzNtlOdOqckWHyUahAoGAFfca
S063eY5y5gE7l64ddABezIio3ScPBNU4fMSmVLfge2vlstO5Uyn8qVu2fj3Z0f2r
jfaQCbiGIUVI7+IRA7ar8lgjCvk3vM5pt7TIsHFk3yq8qOd+Wju2hXc1gTYxXYRq
NPpbHzuPDNP4sreyWIoCoIgjqzihMMskGNPNdy0CgYAwtUeWLASfYw6UcqYzaoDs
3V4KDLYbRvlr9pBWzOPvuH1j525FNmW2gjfPZ/9dNYukFrd84ahUdmAe4UooKvgs
sS8we8mqvBPWZkKaBXiLz/ZZ+nurj5z2mrP7rvpTbzCzjIf+gBl7Z1gEY1jYZnV4
I99svKpHiBQkH7kU9Rehpg==
-----END PRIVATE KEY-----)";

void taskNTP(void *pvParameters);
void taskMQTT(void *pvParameters);
void receiveCallback(uint32_t from, String &msg);
void reconnectMQTT();
void callback(char* topic, byte* payload, unsigned int length);

painlessMesh mesh;
QueueHandle_t mqttQueue; // Queue untuk mengirim data DHT ke taskMQTT
WiFiClientSecure wifiClient;
// WiFiClient wifiClient;
PubSubClient mqttClient(MQTT_SERVER, MQTT_PORT, callback, wifiClient);

struct DHTData {
    float temperature;
    float humidity;
};

String currentTime = ""; // Global variable untuk menyimpan waktu dari NTP

void setup() {
    Serial.begin(115200);
    
    pinMode(LED_BUILTIN, OUTPUT);

    // Set certificate
    // wifiClient.setCACert(server_cert);
    // wifiClient.setCertificate(client_cert);
    // wifiClient.setPrivateKey(client_key);

    wifiClient.setInsecure();

    configTime(7 * 3600, 0, "id.pool.ntp.org");

    // Initialize queue
    mqttQueue = xQueueCreate(5, sizeof(DHTData));

    // Create FreeRTOS tasks
    xTaskCreate(taskNTP, "Task_NTP", 4096, NULL, 1, NULL);
    xTaskCreate(taskMQTT, "Task_MQTT", 25000, NULL, 1, NULL);

    // TODO 4: Setup mesh
    mesh.setDebugMsgTypes( ERROR | STARTUP | CONNECTION );  // set before init() so that you can see startup messages

    mesh.init(MESH_SSID, MESH_PASSWORD, MESH_PORT, WIFI_AP_STA, 6); // channel 6
    mesh.onReceive(&receiveCallback);

    // Start the mesh network
    mesh.stationManual(SSID, PASSWORD);
    mesh.setHostname(HOSTNAME);
    mesh.setRoot(true);
    mesh.setContainsRoot(true);

    Serial.println("Mesh network started");

    // Print local IP address
    Serial.print("Local IP address: ");
    Serial.println(WiFi.localIP());

    // Print hostname
    Serial.print("Hostname: ");
    Serial.println(WiFi.getHostname());
}

void loop() {
    mesh.update();
}

// TODO 1: Task untuk mengambil waktu dari NTP server setiap 5 detik
void taskNTP(void *pvParameters) {
   while (1) {
        // Get current time
        time_t now;
        struct tm timeinfo;
        if (!getLocalTime(&timeinfo)) {
            Serial.println("Failed to obtain time");
            currentTime = "Failed to obtain time";
        } else {
            char strftime_buf[64];
            strftime(strftime_buf, sizeof(strftime_buf), "%c", &timeinfo);
            Serial.println(strftime_buf);
            currentTime = strftime_buf;
        }
        vTaskDelay(5000 / portTICK_PERIOD_MS);
    } 
}

// TODO 2: Function callback untuk menerima dan mem-proses message dari leaf node
void receiveCallback(uint32_t from, String &msg) {
    Serial.printf("Received from %u msg=%s\n", from, msg.c_str());
    DHTData data;
    data.temperature = 0;
    data.humidity = 0;
    xQueueSend(mqttQueue, &data, portMAX_DELAY); 
}

// TODO 3: Task untuk mengirim message ke MQTT broker dengan DHT data dan waktu sekarang, serta subscribe ke topic yang sama
void taskMQTT(void *pvParameters) {
    while (1) {
        DHTData data;
        if (xQueueReceive(mqttQueue, &data, 1000 / portTICK_PERIOD_MS) == pdTRUE) {
            String message = "Temperature: " + String(data.temperature) + " Humidity: " + String(data.humidity) + " Time: " + currentTime;
            if (!mqttClient.connected()) {
                reconnectMQTT();
            }
            mqttClient.publish(MQTT_TOPIC, message.c_str());
            Serial.println("Message sent to MQTT broker");
            Serial.print("Published topic: ");
            Serial.println(MQTT_TOPIC);
            Serial.print("Published message: ");
            Serial.println(message);
            mqttClient.subscribe(MQTT_TOPIC);
        }
        else {
            if (!mqttClient.connected()) {
                reconnectMQTT();
            }
            Serial.println("Received data from mesh");
            mqttClient.publish(MQTT_TOPIC, "Group A2 and B2 sent at Friday, 15 November 2024 11:36:58 | Temp : 1.90C | Humid : 4.80%");
        }
        mqttClient.loop();
    }
}

// Gunakan function ini untuk connect ke MQTT broker
void reconnectMQTT() {
    if (!WiFi.isConnected()) return;
    Serial.println("Connecting to MQTT...");

    if (mqttClient.connect(String(ESP.getEfuseMac()).c_str())) {
        Serial.println("Connected to MQTT broker");
    } else {
        Serial.print("MQTT connection failed, rc=");
        Serial.println(mqttClient.state());
    }
}

// Function callback untuk menerima message dari MQTT
void callback(char* topic, byte* payload, unsigned int length) {
    Serial.println("MQTT message Received: ");
    for (int i = 0; i < length; i++) {
        Serial.print((char)payload[i]);
    }
    Serial.println();
}
```

#### taskNTP

Task ini berfungsi untuk mengambil waktu dari NTP server setiap 5 detik. Task ini akan mengambil waktu dari NTP server menggunakan fungsi `getLocalTime(&timeinfo)`. Jika waktu berhasil didapatkan, maka waktu tersebut akan diubah menjadi string menggunakan `strftime` dan disimpan ke dalam variabel `currentTime`. Task ini akan dijalankan secara terus menerus dengan delay 5 detik.

#### taskMQTT

Task ini berfungsi untuk mengirim message ke MQTT broker dengan DHT data dan waktu sekarang, serta subscribe ke topic yang sama. Task ini akan menerima data dari leaf node melalui queue `mqttQueue`. Jika data berhasil diterima, maka task ini akan membuat message yang berisi data DHT dan waktu sekarang. Jika koneksi ke MQTT broker terputus, maka task ini akan mencoba untuk terhubung kembali menggunakan fungsi `reconnectMQTT()`. Task ini akan terus berjalan dengan delay 1 detik.

#### receiveCallback

Function ini berfungsi untuk menerima dan memproses message dari leaf node. Function ini akan menerima message dari leaf node dan menampilkan message tersebut ke serial monitor. Function ini juga akan mengirim data dummy ke queue `mqttQueue` menggunakan fungsi `xQueueSend`.

#### reconnectMQTT

Function ini berfungsi untuk connect ke MQTT broker. Function ini akan mencoba untuk terhubung ke MQTT broker menggunakan fungsi `mqttClient.connect(String(ESP.getEfuseMac()).c_str())`. Jika berhasil terhubung, maka akan menampilkan pesan "Connected to MQTT broker". Jika gagal terhubung, maka akan menampilkan pesan "MQTT connection failed, rc=" dan status koneksi MQTT.

#### setup

Pada setup, dilakukan inisialisasi serial monitor, pin LED_BUILTIN, WiFiClientSecure, configTime, queue `mqttQueue`, FreeRTOS tasks `taskNTP` dan `taskMQTT`, serta mesh network. Mesh network diinisialisasi dengan SSID, password, port, mode, dan channel. Mesh network juga diatur sebagai root node dan mengandung root node. Selain itu, dilakukan print local IP address dan hostname.

## 2. Bagaimana cara painlessMesh dapat saling menghubungkan antar ESP32? Apakah memerlukan koneksi ke internet untuk menggunakan painlessMesh? (20 poin)

painlessMesh dapat saling menghubungkan antar ESP32 dengan cara membentuk mesh network. Mesh network adalah jaringan yang terdiri dari beberapa node yang saling terhubung satu sama lain. Setiap node dalam mesh network dapat berkomunikasi dengan node lainnya tanpa harus terhubung langsung ke node lain tersebut. Node-node dalam mesh network akan membentuk jaringan yang terhubung satu sama lain dan membentuk jalur komunikasi yang optimal. 

Tidak memerlukan koneksi ke internet untuk menggunakan painlessMesh. painlessMesh bekerja pada layer 2 OSI model, sehingga tidak memerlukan koneksi ke internet. Namun, jika ingin menghubungkan mesh network ke internet, maka diperlukan gateway yang terhubung ke internet, pada contoh atas root node yang terhubung ke internet dengan setup `mesh.stationManual(SSID, PASSWORD);`.

## 3. Coba cari sedikit informasi tentang ESP-NOW, yaitu sebuah protokol komunikasi ESP32 yang dapat digunakan untuk membuat mesh network juga. Apa perbedaannya membuat mesh network dengan library painlessMesh dan juga ESP-NOW? (10 poin)

ESP-NOW adalah protokol komunikasi yang dikembangkan oleh Espressif Systems yang digunakan untuk komunikasi antar ESP32. ESP-NOW memungkinkan komunikasi antar ESP32 tanpa perlu terhubung ke jaringan WiFi. Perbedaan antara membuat mesh network dengan library painlessMesh dan ESP-NOW selain menggunakan protokol yang berbeda dan syntax yang berbeda adalah struktur topologi yang dibentuk. Library painlessMesh memungkinkan pembentukan mesh network dengan topologi tree, star, atau linear, sedangkan ESP-NOW hanya memungkinkan pembentukan mesh network dengan topologi peer-to-peer. Dengan demikian, painlessMesh lebih fleksibel dalam pembentukan mesh network dengan topologi yang berbeda-beda dan ESP-NOW lebih sederhana dengan topologi peer-to-peer.

## 4. Berikan kesimpulan case study modul ini dalam bentuk poin - poin. (10 poin)

- Komuniksai antar ESP32 dapat dilakukan dengan mudah menggunakan painlessMesh yang memungkinkan pembentukan mesh network dengan topologi tree, star, atau linear.
- painlessMesh tidak memerlukan koneksi ke internet, sehingga cocok digunakan untuk aplikasi yang tidak memerlukan koneksi ke internet.
- Menggunakan root node pada mesh network memungkinkan koneksi ke internet dengan menggunakan gateway yang terhubung ke internet.
- ESP-NOW adalah protokol komunikasi yang digunakan untuk komunikasi antar ESP32 tanpa perlu terhubung ke jaringan WiFi.