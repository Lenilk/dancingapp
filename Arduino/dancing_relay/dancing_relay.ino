#include <AntoIO.h>
// Relay Esp8266
const char *ssid = "FOF";
const char *pass = "11111111";
const char *user = "Lenilk";
const char *token = "86jcgspzAT1YFicTxnVrMdQ8t6qSVxeNLVTgYOgk";
const char *thing = "Relay";

// initialize AntoIO instance
AntoIO anto(user, token, thing);
struct Note {
  int padTouch[6];
  unsigned int endTime;
  String word;
};
const Note firstSong1[] = {
  { {}, 11000, "" },
  { { 1 }, 11220, "เดือน" },
  { { 3 }, 12580, "หงาย" },
  { { 3, 5 }, 13320, "เย็น" },
  { { 1 }, 14260, "พระพาย" },
  { { 2 }, 15170, "โบกพริ้ว" },
  { { 4 }, 16440, "ปลิวมา" },
  { { 4, 6 }, 17340, "เย็น" },
  { { 2 }, 18270, "อะไร" },
  { { 1 }, 19090, "ก็ไม่" },
  { { 3 }, 20030, "เย็นจิต" },
  { { 3, 5 }, 21050, "เท่าเย็น" },
  { { 1 }, 22100, "ผูกมิตร" },
  { { 2 }, 23100, "ไม่เบื่อ" },
  { { 2, 4 }, 23580, "ระอา" },
  { { 4, 6 }, 24500, "เย็นร่ม" },
  { { 2 }, 25500, "ธงไทย" },
  { { 1 }, 26490, "ปกไป" },
  { { 3 }, 27560, "ทั่วหล้า" },
  { { 3, 5 }, 28800, "เย็นยิ่ง" },
  { { 1 }, 29460, "น้ำฟ้า" },
  { { 2 }, 30260, "มาประ" },
  { { 4 }, 31500, "พรมเอย" },
  { { 4, 6 }, 32430, "ยาม" },
  { { 2 }, 33520, "กลางคืน" },
  { { 1 }, 34200, "เดือน" },
  { { 3 }, 35400, "หงาย" },
  { { 3, 5 }, 36190, "เย็น" },
  { { 1 }, 37090, "พระพาย" },
  { { 2 }, 38060, "โบกพลิ้ว" },
  { { 4 }, 39250, "ปลิวมา" },
  { { 4, 6 }, 40130, "เย็น" },
  { { 2 }, 41110, "อะไร" },
  { { 1 }, 41530, "ก็ไม่" },
  { { 3 }, 42500, "เย็นจิต" },
  { { 3, 5 }, 43500, "เท่าเย็น" },
  { { 1 }, 44450, "ผูกมิตร" },
  { { 2 }, 45440, "ไม่เบื่อ" },
  { { 4 }, 46400, "ระอา" },
  { { 4, 6 }, 47390, "เย็นร่ม" },
  { { 2 }, 48270, "ธงไทย" },
  { { 1 }, 49260, "ปกไป" },
  { { 3 }, 50430, "ทั่วหล้า" },
  { { 3, 5 }, 51270, "เย็นยิ่ง" },
  { { 1 }, 52470, "น้ำฟ้า" },
  { { 2 }, 53360, "มาประ" },
  { { 4 }, 58160, "พรมเอย" },
  { {}, 0, "จบ" }
};
const Note SecondSong1[] = { { {}, 7400, "" },
                             { { 1 }, 8410, "เดือน" },
                             { { 3 }, 9340, "พราว" },
                             { { 3, 5 }, 10340, "ฉับ" },
                             { { 1 }, 11310, "ดาว" },
                             { { 2 }, 12210, "แวววาว" },
                             { { 4 }, 13170, "ระยับ" },
                             { { 4, 6 }, 14060, "ฉับ" },
                             { { 2 }, 15150, "ฉับ" },
                             { { 1 }, 16010, "แสงดาว" },
                             { { 3 }, 16510, "ประดับ" },
                             { { 3, 5 }, 17510, "ฉับ" },
                             { { 1 }, 18390, "ส่งให้" },
                             { { 2 }, 19430, "เดือนงาม" },
                             { { 4 }, 20280, "เด่น" },
                             { { 4, 6 }, 21220, "ฉับ" },
                             { { 2 }, 22120, "ฉับ" },
                             { { 1 }, 22230, "ดวง" },
                             { { 3 }, 23230, "หน้า" },
                             { { 3, 5 }, 24150, "ฉับ" },
                             { { 1 }, 25040, "โสภา" },
                             { { 2 }, 25560, "เพียง" },
                             { { 4 }, 26470, "เดือนเพ็ญ" },
                             { { 4, 6 }, 27380, "คุณ" },
                             { { 2 }, 28340, "ความดี" },
                             { { 1 }, 29260, "ที่" },
                             { { 3 }, 30180, "เห็น" },
                             { { 3, 5 }, 31100, "เสริม" },
                             { { 1 }, 32040, "ให้เด่น" },
                             { { 2 }, 32550, "เลิศ" },
                             { { 4 }, 33480, "งาม" },
                             { { 4, 6 }, 34420, "ฉับ" },
                             { { 2 }, 35360, "ฉับ" },
                             { { 1 }, 36250, "ขวัญ" },
                             { { 3 }, 37210, "ใจ" },
                             { { 3, 5 }, 38170, "ฉับ" },
                             { { 1 }, 39050, "หญิงไทย" },
                             { { 2 }, 39570, "ส่งศรี" },
                             { { 4 }, 40500, "ชาติ" },
                             { { 4, 6 }, 41410, "รูป" },
                             { { 2 }, 42330, "งาม" },
                             { { 1 }, 43270, "พิ" },
                             { { 3 }, 44190, "ลาศ" },
                             { { 3, 5 }, 45130, "ใจ" },
                             { { 1 }, 46030, "กล้ากาจ" },
                             { { 2 }, 47000, "เรือง" },
                             { { 4 }, 47490, "นาม" },
                             { { 4, 6 }, 48370, "ฉับ" },
                             { { 2 }, 49320, "ฉับ" },
                             { { 1 }, 50200, "เกียรติ" },
                             { { 3 }, 51160, "ยศ" },
                             { { 3, 5 }, 52060, "ฉับ" },
                             { { 1 }, 52580, "ก้อง" },
                             { { 2 }, 53470, "ปรากฎ" },
                             { { 4 }, 54400, "ทั่วคาม" },
                             { { 4, 6 }, 55310, "หญิง" },
                             { { 2 }, 56240, "ไทย" },
                             { { 1 }, 57150, "ใจ" },
                             { { 3 }, 58080, "งาม" },
                             { { 3, 5 }, 59050, "ยิ่งเดือน" },
                             { { 1 }, 59530, "ดาว" },
                             { { 2 }, 60470, "พราว" },
                             { { 4 }, 61370, "แพรว" },
                             { { 4, 6 }, 62320, "ฉับ" },
                             { { 2 }, 63260, "ฉับ" },
                             { { 1 }, 64200, "เดือน" },
                             { { 3 }, 65080, "พราว" } };
const Note SecondSong2[] = { { { 3, 5 }, 66020, "ฉับ" },
                             { { 1 }, 66520, "ดาว" },
                             { { 2 }, 67460, "แวววาว" },
                             { { 4 }, 68360, "ระยับ" },
                             { { 4, 6 }, 69300, "ฉับ" },
                             { { 2 }, 70220, "ฉับ" },
                             { { 1 }, 71150, "แสงดาว" },
                             { { 3 }, 72060, "ประดับ" },
                             { { 3, 5 }, 73030, "ฉับ" },
                             { { 1 }, 73470, "ส่งให้" },
                             { { 2 }, 74400, "เดือนงาม" },
                             { { 4 }, 75360, "เด่น" },
                             { { 4, 6 }, 76260, "ฉับ" },
                             { { 2 }, 77220, "ฉับ" },
                             { { 1 }, 78100, "ดวง" },
                             { { 3 }, 79000, "หน้า" },
                             { { 3, 5 }, 79560, "ฉับ" },
                             { { 1 }, 80460, "โสภา" },
                             { { 2 }, 81330, "เพียง" },
                             { { 4 }, 82260, "เดือนเพ็ญ" },
                             { { 4, 6 }, 83210, "คุณ" },
                             { { 2 }, 84110, "ความดี" },
                             { { 1 }, 85040, "ที่" },
                             { { 3 }, 85520, "เห็น" },
                             { { 3, 5 }, 86460, "เสริม" },
                             { { 1 }, 87380, "ให้เด่น" },
                             { { 2 }, 88300, "เลิศ" },
                             { { 4 }, 89220, "งาม" },
                             { { 4, 6 }, 90130, "ฉับ" },
                             { { 2 }, 91070, "ฉับ" },
                             { { 1 }, 91570, "ขวัญ" },
                             { { 3 }, 92460, "ใจ" },
                             { { 3, 5 }, 93410, "ฉับ" },
                             { { 1 }, 94350, "หญิงไทย" },
                             { { 2 }, 95250, "ส่งศรี" },
                             { { 4 }, 96150, "ชาติ" },
                             { { 4, 6 }, 97050, "รูป" },
                             { { 2 }, 97570, "งาม" },
                             { { 1 }, 98490, "พิ" },
                             { { 3 }, 99380, "ลาศ" },
                             { { 3, 5 }, 100330, "ใจ" },
                             { { 1 }, 101220, "กล้ากาจ" },
                             { { 2 }, 102190, "เรือง" },
                             { { 4 }, 103050, "นาม" },
                             { { 4, 6 }, 103550, "ฉับ" },
                             { { 2 }, 104430, "ฉับ" },
                             { { 1 }, 105410, "เกียรติ" },
                             { { 3 }, 106300, "ยศ" },
                             { { 3, 5 }, 107230, "ฉับ" },
                             { { 1 }, 108130, "ก้อง" },
                             { { 2 }, 109090, "ปรากฎ" }, 
                             { { 4 }, 109550, "ทั่วคาม" },
                             { { 4, 6 }, 110500, "หญิง" },
                             { { 2 }, 111380, "ไทย" },
                             { { 1 }, 112290, "ใจ" },
                             { { 3 }, 113260, "งาม" },
                             { { 3, 5 }, 114200, "ยิ่งเดือน" },
                             { { 1 }, 115260, "ดาว" },
                             { { 2 }, 116350, "พราว" },
                             { { 4 }, 120360, "แพรว" },
                             { {}, 0, "จบ" } };
const Note ThirdSong[] = {
  { {}, 7490, "" },
  { {}, 8110, "ดวง" },
  { {}, 9090, "จันทร์" },
  { { 1 }, 9440, "ขวัญ" },
  { { 3 }, 10440, "ฟ้า" },
  { { 3, 5 }, 11270, "ชื่น" },
  { { 1 }, 12340, "ชีวา" },
  { { 2 }, 13160, "ขวัญ" },
  { { 4 }, 13800, "พี่" },
  { { 4, 6 }, 14260, "ฉับ" },
  { { 2 }, 15490, "จันทร์" },
  { { 1 }, 16320, "ประจำ" },
  { { 3 }, 17500, "ราตรี" },
  { { 3, 5 }, 18180, "แต่" },
  { { 1 }, 19140, "ขวัญพี่" },
  { { 2 }, 20030, "ประ" },
  { { 4 }, 20890, "จำใจ" },
  { { 4, 6 }, 21370, "ฉับ" },
  { { 2 }, 22480, "ที่" },
  { { 1 }, 23360, "เทิดทูน" },
  { { 3 }, 25000, "คือชาติ" },
  { { 3, 5 }, 25400, "เอก" },
  { { 1 }, 26280, "ราช" },
  { { 2 }, 27180, "อธิป" },
  { { 4 }, 28120, "ไตร" },
  { { 4, 6 }, 29150, "ถนอม" },
  { { 2 }, 29570, "แนบ" },
  { { 1 }, 30260, "สนิท" },
  { { 3 }, 31220, "ใน" },
  { { 3, 5 }, 32430, "คืนขวัญ" },
  { { 1 }, 33350, "ใจ" },
  { { 2 }, 34270, "พี่" },
  { { 4 }, 34400, "เอย" },
  { { 4, 6 }, 35280, "ฉับ" },
  { { 2 }, 36250, "ดวงจันทร์" },
  { { 1 }, 37540, "ขวัญ" },
  { { 3 }, 38500, "ฟ้า" },
  { { 3, 5 }, 39290, "ชื่น" },
  { { 1 }, 40360, "ชีวา" },
  { { 2 }, 41260, "ขวัญ" },
  { { 4 }, 41410, "พี่" },
  { { 4, 6 }, 42330, "ฉับ" },
  { { 2 }, 43470, "จันทร์" },
  { { 1 }, 44290, "ประจำ" },
  { { 3 }, 45490, "ราตรี" },
  { { 3, 5 }, 46140, "แต่" },
  { { 1 }, 47070, "ขวัญพี่" },
  { { 2 }, 47330, "ประ" },
  { { 4 }, 48440, "จำใจ" },
  { { 4, 6 }, 49280, "ฉับ" },
  { { 2 }, 50360, "ที่" },
  { { 1 }, 51310, "เทิดทูน" },
  { { 3 }, 52450, "ชาติ" },
  { { 3, 5 }, 53290, "เอก" },
  { { 1 }, 54210, "ราช" },
  { { 2 }, 55110, "อธิป" },
  { { 4 }, 56040, "ไตร" },
  { { 4, 6 }, 57120, "ถนอม" },
  { { 2 }, 57470, "แนบ" },
  { { 1 }, 58270, "สนิท" },
  { { 3 }, 59180, "ใน" },
  { { 3, 5 }, 61050, "คือขวัญ" },
  { { 1 }, 61590, "ใจ" },
  { { 2 }, 63130, "พี่" },
  { { 4 }, 68000, "เอย" },
  { {}, 0, "จบ" }
};
int songRound = 0;
int i;
#define sw1 D0
#define sw2 D1
#define sw3 D2
#define sw4 D3
#define sw5 D4
#define sw6 D5
const int padGrp[] = { sw1, sw2, sw3, sw4, sw5, sw6 };
int value;
const Note *music[4] = { firstSong1, SecondSong1, SecondSong2, ThirdSong };
void setup() {
  Serial.begin(9600);
  delay(10);

  Serial.println();
  Serial.println();
  Serial.print(F("Anto library version: "));
  Serial.println(anto.getVersion());


  Serial.print(F("\nTrying to connect "));
  Serial.print(ssid);
  Serial.println("...");

  anto.begin(ssid, pass, messageReceived);
  Serial.println(F("\nConnected Anto done"));
  //Subscript Channels
  anto.sub("sw1");
  anto.sub("sw2");
  anto.sub("sw3");
  anto.sub("sw4");
  anto.sub("sw5");
  anto.sub("sw6");
  anto.sub("isStart");
  anto.sub("song");
  anto.sub("speed");
  anto.pub("isStart", 0);
  anto.pub("speed", 1);
  anto.pub("song", 0);
  //Port output
  pinMode(sw1, OUTPUT);
  pinMode(sw2, OUTPUT);
  pinMode(sw3, OUTPUT);
  pinMode(sw4, OUTPUT);
  pinMode(sw5, OUTPUT);
  pinMode(sw6, OUTPUT);
  digitalWrite(sw1, HIGH);
  digitalWrite(sw2, HIGH);
  digitalWrite(sw3, HIGH);
  digitalWrite(sw4, HIGH);
  digitalWrite(sw5, HIGH);
  digitalWrite(sw6, HIGH);
  pinMode(BUILTIN_LED, OUTPUT);
  for (i = 0; i < 6; i++) {
    digitalWrite(padGrp[i], LOW);
    delay(1000);
    digitalWrite(padGrp[i], HIGH);
  }
}
int num = 0;
Note currentNote;
unsigned long start;
unsigned long currentMilli;
int interval = 0;
bool isStart = false;
int numNotes;

int currentPad;
auto currentSong = firstSong1;
int k;
bool wasResetPins = true;
float speed = 1;
unsigned int intervalTime = 0;
int selectedSong = 0;
const int endRoundList[3] = { 0, 1, 3 };
const int AllSongRound[5] = { 47 + 1, 67, 60 + 1, 65+1 };
const int songRoundList[3] = { 1, 2, 1 };
void loop() {
  anto.mqtt.loop();
  if (!isStart) {
    resetPins();
    return;
  }
  if (selectedSong == 0) {
    isStart = false;
    anto.pub("isStart", 0);
    wasResetPins = false;
  }
  if (songRound == songRoundList[selectedSong - 1]) {
    wasResetPins = false;
    resetPins();
    anto.pub("isStart", 0);
    anto.pub("speed", 1);
    anto.pub("song", 0);
    songRound = 0;
    isStart = false;
    intervalTime = 0;
    Serial.println("END");
    return;
  }
  if (num == AllSongRound[endRoundList[selectedSong - 1] + songRound]) {

    songRound++;
    Serial.print("Song Round :");
    Serial.println(songRound);
    num = 0;
    if (songRound != songRoundList[selectedSong - 1]) {
      currentSong = music[endRoundList[selectedSong - 1] + songRound];
      intervalTime = currentSong[num].endTime / speed;
    } else {
      return;
    }

  } else {
    if (millis() - start >= intervalTime) {

      Serial.println(millis());
      Serial.println(start);
      currentNote = currentSong[num];
      Serial.print("Time: ");
      Serial.println(millis() - start);
      Serial.println(currentNote.word);
      Serial.println(F("Turn on relay"));
      k = 0;
      for (i = 0; i < 6; i++) {
        currentPad = currentNote.padTouch[k] - 1;
        if (i == currentPad) {
          Serial.print("Turn on ");
          Serial.println(currentPad);
          digitalWrite(padGrp[currentPad], LOW);
          k++;
          continue;
        }
        Serial.print("Turn off ");
        Serial.println(i);
        digitalWrite(padGrp[i], HIGH);
      }
      Serial.println();
      intervalTime = currentSong[num].endTime / speed;
      num++;
      Serial.print("Next interval:");
      Serial.println(intervalTime);
      Serial.print("speed:");
      Serial.println(speed);
    }
  }
}
void resetPins() {
  if (!wasResetPins) {
    Serial.println("Reset Relay");
    digitalWrite(padGrp[0], HIGH);
    digitalWrite(padGrp[1], HIGH);
    digitalWrite(padGrp[2], HIGH);
    digitalWrite(padGrp[3], HIGH);
    digitalWrite(padGrp[4], HIGH);
    digitalWrite(padGrp[5], HIGH);
    wasResetPins = true;
  }
}
// a callback function for arriving data.
void messageReceived(String thing, String channel, String payload) {

  Serial.print("Recieved: ");
  Serial.print(thing);
  Serial.print("/");
  Serial.print(channel);
  Serial.print("-> ");
  Serial.println(payload);
  if (channel.equals("song")) {
    if (!isStart) {
      selectedSong = payload.toInt();
    }
  }
  if (channel.equals("speed")) {
    if (!isStart) {
      speed = payload.toFloat();
    }
  }
  if (channel.equals("isStart")) {
    resetPins();
    value = payload.toInt();
    if (value == 1) {
      Serial.println("Started");
      if (selectedSong != 0) {
        start = millis();
        Serial.println(start);
        isStart = true;
        currentSong = music[endRoundList[selectedSong - 1] + songRound];
        intervalTime = 0;
        wasResetPins = false;
      }
    } else {
      Serial.println("STOPPED");
      isStart = false;
      num = 0;
      intervalTime = 0;
      songRound = 0;
    }
  }
  if (channel.equals("sw1")) {
    value = payload.toInt();
    if (value == 1) {
      digitalWrite(sw1, LOW);

    } else {
      digitalWrite(sw1, HIGH);
    }
  } else if (channel.equals("sw2")) {
    value = payload.toInt();
    if (value == 1) {
      digitalWrite(sw2, LOW);
    } else {
      digitalWrite(sw2, HIGH);
    }
  } else if (channel.equals("sw3")) {
    value = payload.toInt();
    if (value == 1) {
      digitalWrite(sw3, LOW);
    } else {

      digitalWrite(sw3, HIGH);
    }
  } else if (channel.equals("sw4")) {
    value = payload.toInt();
    if (value == 1) {
      digitalWrite(sw4, LOW);
    } else {
      digitalWrite(sw4, HIGH);
    }
  } else if (channel.equals("sw5")) {
    value = payload.toInt();
    if (value == 1) {
      digitalWrite(sw5, LOW);
    } else {
      digitalWrite(sw5, HIGH);
    }
  } else if (channel.equals("sw6")) {
    value = payload.toInt();
    if (value == 1) {
      digitalWrite(sw6, LOW);
    } else {
      digitalWrite(sw6, HIGH);
    }
  }
}