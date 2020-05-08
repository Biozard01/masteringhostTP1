# Maîtrise de poste - Day 1

## Self-footprinting

### Host OS

- nom de la machine

```powershell
PS C:\Users\arthu> Get-ComputerInfo

CsCaption                                               : LAPTOP-T6GHI3P2
```

- OS et version

```powershell
PS C:\Users\arthu> Get-ComputerInfo

WindowsProductName                                      : Windows 10 Home
WindowsVersion                                          : 1909
```

- architecture processeur (32-bit, 64-bit, ARM, etc)

```powershell
PS C:\Users\arthu> Get-ComputerInfo

CsSystemType                                            : x64-based PC
```

- modèle du processeur

```powershell
PS C:\Users\arthu> Get-ComputerInfo

CsProcessors                                            : {Intel(R) Core(TM) i7-8565U CPU @ 1.80GHz}
```

- quantité RAM et modèle de la RAM

```powershell
PS C:\Users\arthu> Get-WmiObject win32_physicalmemory | Format-Table Manufacturer,Banklabel,Configuredclockspeed,Devicelocator,Capacity,Serialnumber -autosize
Manufacturer Banklabel Configuredclockspeed Devicelocator    Capacity Serialnumber
------------ --------- -------------------- -------------    -------- ------------
SK Hynix     BANK 2                    2400 ChannelB-DIMM0 8589934592 429C939B

```

### Devices

- la marque et le modèle de votre processeur

```powershell
PS C:\Users\arthu> Get-WmiObject Win32_Processor

Caption           : Intel64 Family 6 Model 142 Stepping 11
DeviceID          : CPU0
Manufacturer      : GenuineIntel
MaxClockSpeed     : 1992
Name              : Intel(R) Core(TM) i7-8565U CPU @ 1.80GHz
SocketDesignation : U3E1



```

```powershell
PS C:\Users\arthu> echo $env:NUMBER_OF_PROCESSORS                                                              8
```

Mon ordinateur a donc 8 processeur.

```powershell
PS C:\Users\arthu> Get-WmiObject -class Win32_processor | ft NumberOfCores,NumberOfLogicalProcessors
NumberOfCores NumberOfLogicalProcessors
------------- -------------------------
            4                         8


```

Mon processeur a donc 4 coeur.

Le nom de mon processeur (Intel(R) Core(TM) i7-8565U) est composé de sa marque, Intel(R) Core(TM), le i7 et la pour indiqué un "type" de processeur (référence pour la marque et le consommateur), le premier chiffre après le i7 et pour la génération du processeur, les 3 chiffres après sont les SKU (Stock Keeping Unit) c'est à dire le numéro du modèle, le U veut dire que le processeur est un ultra-low power c'est à dire qu'il ne prend pas beaucoup de batterie.

#### - la marque et le modèle :

- de votre touchpad/trackpad

```powershell
PS C:\Users\arthu> Get-PnpDevice
Status     Class           FriendlyName
------     -----           ------------
OK         HIDClass        ASUS Precision Touchpad

```

- de vos enceintes intégrées

```powershell
PS C:\Users\arthu> Get-PnpDevice
Status     Class           FriendlyName
------     -----           ------------
OK         AudioEndpoint   Haut-parleurs (Realtek(R) Audio)

```

- de votre disque dur principal

```powershell
PS C:\Users\arthu> Get-PhysicalDisk

Number FriendlyName        SerialNumber     MediaType CanPool OperationalStatus HealthStatus Usage            Size
------ ------------        ------------     --------- ------- ----------------- ------------ -----            ----
1      INTEL SSDSCKKW256G8 BTLA80121Q51256J SSD       False   OK                Healthy      Auto-Select 238.47 GB

```

#### - Disque dur

- identifier les différentes partitions de votre/vos disque(s) dur(s)

```powershell
PS C:\Users\arthu> Get-Partition


   DiskPath : \\?\scsi#disk&ven_intel&prod_ssdsckkw256g8#4&fd24e48&0&000200#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}

PartitionNumber  DriveLetter Offset                                                                                              Size Type
---------------  ----------- ------                                                                                              ---- ----
1                            1048576                                                                                           260 MB System
2                            273678336                                                                                          16 MB Reserved
3                C           290455552                                                                                      237.37 GB Basic
4                            255168872448                                                                                      850 MB Recovery


   DiskPath : \\?\scsi#disk&ven_toshiba&prod_mq04abf100#4&fd24e48&0&000000#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}

PartitionNumber  DriveLetter Offset                                                                                              Size Type
---------------  ----------- ------                                                                                              ---- ----
1                D           1048576                                                                                        931.51 GB Basic


```

- déterminer le système de fichier de chaque partition

```powershell
PS C:\Users\arthu> Get-Partition


   DiskPath : \\?\scsi#disk&ven_intel&prod_ssdsckkw256g8#4&fd24e48&0&000200#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}


   DiskPath : \\?\scsi#disk&ven_toshiba&prod_mq04abf100#4&fd24e48&0&000000#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}


```

- expliquer la fonction de chaque partition

System : Cette partition contient les fichier de boot de l'ordinateur.

Reserved : Cette partition contient les fichier essentiel à l'ordinateur.

Basic : Cette partition contient l'OS de l'ordinateur.

Recovery : Cette partition contient les fichier et dossier de récupération en cas de problème.

### Network

- Afficher la liste des cartes réseau de votre machine

```powershell
PS C:\Users\arthu> Get-NetAdapter | fl Name, InterfaceIndex


Name           : VirtualBox Host-Only Network #5
InterfaceIndex : 25

Name           : Wi-Fi
InterfaceIndex : 24

Name           : Ethernet 2
InterfaceIndex : 23

Name           : VMware Network Adapter VMnet8
InterfaceIndex : 21

Name           : VirtualBox Host-Only Network #4
InterfaceIndex : 20

Name           : Connexion réseau Bluetooth
InterfaceIndex : 18

Name           : VirtualBox Host-Only Network #3
InterfaceIndex : 12

Name           : VirtualBox Host-Only Network
InterfaceIndex : 11

Name           : VirtualBox Host-Only Network #2
InterfaceIndex : 7

Name           : VMware Network Adapter VMnet1
InterfaceIndex : 2


```

- expliquer la fonction de chacune d'entre elles

L'interface Wi-Fi me permet d'avoir accès au Wi-Fi.

L'interface Ethernet 2 me permet de me connecter en Ethernet.

L'interface Connexion réseau Bluetooth me permet de me connecter avec d'autre appareil en Bluetooth.

Les interfaces : VirtualBox Host-Only Network, VirtualBox Host-Only Network #2, VirtualBox Host-Only Network #3, VirtualBox Host-Only Network #4 et VirtualBox Host-Only Network #5, sont utilisé par nos VM Virtual Box.

Les interfaces : VMware Network Adapter VMnet1 et VMware Network Adapter VMnet8, sont utilisé par nos VM VWare.

- Lister tous les ports TCP et UDP en utilisation

```powershell
PS C:\Users\arthu> netstat -ano
Connexions actives

  Proto  Adresse locale         Adresse distante       État
  TCP    0.0.0.0:80             0.0.0.0:0              LISTENING       4
  TCP    0.0.0.0:135            0.0.0.0:0              LISTENING       1112
  TCP    0.0.0.0:445            0.0.0.0:0              LISTENING       4
  TCP    0.0.0.0:808            0.0.0.0:0              LISTENING       4928
  TCP    0.0.0.0:902            0.0.0.0:0              LISTENING       4340
  TCP    0.0.0.0:912            0.0.0.0:0              LISTENING       4340
  TCP    0.0.0.0:5040           0.0.0.0:0              LISTENING       9536
  TCP    0.0.0.0:49664          0.0.0.0:0              LISTENING       704
  TCP    0.0.0.0:49665          0.0.0.0:0              LISTENING       584
  TCP    0.0.0.0:49666          0.0.0.0:0              LISTENING       1796
  TCP    0.0.0.0:49667          0.0.0.0:0              LISTENING       1856
  TCP    0.0.0.0:49668          0.0.0.0:0              LISTENING       2176
  TCP    0.0.0.0:49669          0.0.0.0:0              LISTENING       3324
  TCP    0.0.0.0:49689          0.0.0.0:0              LISTENING       676
  TCP    10.2.1.1:139           0.0.0.0:0              LISTENING       4
  TCP    10.3.1.1:139           0.0.0.0:0              LISTENING       4
  TCP    10.3.2.1:139           0.0.0.0:0              LISTENING       4
  TCP    127.0.0.1:6463         0.0.0.0:0              LISTENING       13876
  TCP    127.0.0.1:28385        0.0.0.0:0              LISTENING       4
  TCP    127.0.0.1:49350        0.0.0.0:0              LISTENING       2980
  TCP    127.0.0.1:49351        0.0.0.0:0              LISTENING       3316
  TCP    127.0.0.1:49722        0.0.0.0:0              LISTENING       4792
  TCP    127.0.0.1:51114        127.0.0.1:49350        TIME_WAIT       0
  TCP    127.0.0.1:51115        127.0.0.1:49350        TIME_WAIT       0
  TCP    127.0.0.1:51116        127.0.0.1:49350        TIME_WAIT       0
  TCP    127.0.0.1:51118        127.0.0.1:49350        TIME_WAIT       0
  TCP    127.0.0.1:51119        127.0.0.1:49350        TIME_WAIT       0
  TCP    127.0.0.1:51120        127.0.0.1:49350        TIME_WAIT       0
  TCP    192.168.0.31:139       0.0.0.0:0              LISTENING       4
  TCP    192.168.0.31:49698     40.67.254.36:443       ESTABLISHED     4684
  TCP    192.168.0.31:49789     162.159.130.234:443    ESTABLISHED     3052
  TCP    192.168.0.31:49901     74.125.133.188:5228    ESTABLISHED     10160
  TCP    192.168.0.31:49994     162.159.138.234:443    ESTABLISHED     3052
  TCP    192.168.0.31:50731     185.63.145.1:443       CLOSE_WAIT      10948
  TCP    192.168.0.31:50732     93.184.220.29:80       CLOSE_WAIT      10948
  TCP    192.168.0.31:50756     162.159.133.233:443    ESTABLISHED     3052
  TCP    192.168.0.31:51035     151.101.120.157:443    ESTABLISHED     10160
  TCP    192.168.0.31:51039     104.244.42.200:443     ESTABLISHED     10160
  TCP    192.168.0.31:51057     40.77.226.250:443      ESTABLISHED     10160
  TCP    192.168.0.31:51061     151.101.122.217:443    ESTABLISHED     10160
  TCP    192.168.0.31:51068     35.227.221.109:443     ESTABLISHED     10160
  TCP    192.168.0.31:51082     162.159.137.234:443    ESTABLISHED     3052
  TCP    192.168.0.31:51091     40.77.226.250:443      ESTABLISHED     10160
  TCP    192.168.0.31:51094     3.218.125.188:443      ESTABLISHED     10160
  TCP    192.168.0.31:51095     3.218.125.188:443      ESTABLISHED     10160
  TCP    192.168.0.31:51104     52.157.234.37:443      ESTABLISHED     9020
  TCP    192.168.0.31:51107     152.199.19.160:443     CLOSE_WAIT      10160
  TCP    192.168.0.31:51108     23.57.4.240:443        CLOSE_WAIT      10160
  TCP    192.168.0.31:51109     82.216.34.152:443      CLOSE_WAIT      10160
  TCP    192.168.0.31:51110     2.21.119.126:443       ESTABLISHED     10160
  TCP    192.168.0.31:51111     99.80.110.198:443      ESTABLISHED     10160
  TCP    192.168.0.31:51112     40.77.226.250:443      ESTABLISHED     10160
  TCP    192.168.0.31:51113     52.109.12.18:443       ESTABLISHED     4976
  TCP    192.168.41.1:139       0.0.0.0:0              LISTENING       4
  TCP    192.168.56.1:139       0.0.0.0:0              LISTENING       4
  TCP    [::]:80                [::]:0                 LISTENING       4
  TCP    [::]:135               [::]:0                 LISTENING       1112
  TCP    [::]:445               [::]:0                 LISTENING       4
  TCP    [::]:808               [::]:0                 LISTENING       4928
  TCP    [::]:49664             [::]:0                 LISTENING       704
  TCP    [::]:49665             [::]:0                 LISTENING       584
  TCP    [::]:49666             [::]:0                 LISTENING       1796
  TCP    [::]:49667             [::]:0                 LISTENING       1856
  TCP    [::]:49668             [::]:0                 LISTENING       2176
  TCP    [::]:49669             [::]:0                 LISTENING       3324
  TCP    [::]:49689             [::]:0                 LISTENING       676
  TCP    [::1]:49670            [::]:0                 LISTENING       5100
  UDP    0.0.0.0:500            *:*                                    5024
  UDP    0.0.0.0:1900           *:*                                    2980
  UDP    0.0.0.0:4500           *:*                                    5024
  UDP    0.0.0.0:5050           *:*                                    9536
  UDP    0.0.0.0:5353           *:*                                    13372
  UDP    0.0.0.0:5353           *:*                                    13372
  UDP    0.0.0.0:5353           *:*                                    13372
  UDP    0.0.0.0:5353           *:*                                    13372
  UDP    0.0.0.0:5353           *:*                                    13372
  UDP    0.0.0.0:5353           *:*                                    13372
  UDP    0.0.0.0:5353           *:*                                    13372
  UDP    0.0.0.0:5353           *:*                                    13372
  UDP    0.0.0.0:5353           *:*                                    13372
  UDP    0.0.0.0:5353           *:*                                    13372
  UDP    0.0.0.0:5353           *:*                                    13372
  UDP    0.0.0.0:5353           *:*                                    13372
  UDP    0.0.0.0:5353           *:*                                    2780
  UDP    0.0.0.0:5355           *:*                                    2780
  UDP    0.0.0.0:52367          *:*                                    13876
  UDP    0.0.0.0:54110          *:*                                    10160
  UDP    0.0.0.0:55215          *:*                                    10160
  UDP    0.0.0.0:60067          *:*                                    10160
  UDP    0.0.0.0:61865          *:*                                    13876
  UDP    0.0.0.0:61946          *:*                                    10160
  UDP    10.2.1.1:137           *:*                                    4
  UDP    10.2.1.1:138           *:*                                    4
  UDP    10.2.1.1:1900          *:*                                    8708
  UDP    10.2.1.1:2177          *:*                                    5896
  UDP    10.2.1.1:56071         *:*                                    8708
  UDP    10.3.1.1:137           *:*                                    4
  UDP    10.3.1.1:138           *:*                                    4
  UDP    10.3.1.1:1900          *:*                                    8708
  UDP    10.3.1.1:2177          *:*                                    5896
  UDP    10.3.1.1:56073         *:*                                    8708
  UDP    10.3.2.1:137           *:*                                    4
  UDP    10.3.2.1:138           *:*                                    4
  UDP    10.3.2.1:1900          *:*                                    8708
  UDP    10.3.2.1:2177          *:*                                    5896
  UDP    10.3.2.1:56074         *:*                                    8708
  UDP    127.0.0.1:1900         *:*                                    8708
  UDP    127.0.0.1:10010        *:*                                    4792
  UDP    127.0.0.1:51452        *:*                                    8860
  UDP    127.0.0.1:56075        *:*                                    8708
  UDP    127.0.0.1:59480        *:*                                    4912
  UDP    192.168.0.31:137       *:*                                    4
  UDP    192.168.0.31:138       *:*                                    4
  UDP    192.168.0.31:1900      *:*                                    8708
  UDP    192.168.0.31:2177      *:*                                    5896
  UDP    192.168.0.31:56070     *:*                                    8708
  UDP    192.168.41.1:137       *:*                                    4
  UDP    192.168.41.1:138       *:*                                    4
  UDP    192.168.41.1:1900      *:*                                    8708
  UDP    192.168.41.1:2177      *:*                                    5896
  UDP    192.168.41.1:56072     *:*                                    8708
  UDP    192.168.56.1:137       *:*                                    4
  UDP    192.168.56.1:138       *:*                                    4
  UDP    192.168.56.1:1900      *:*                                    8708
  UDP    192.168.56.1:2177      *:*                                    5896
  UDP    192.168.56.1:56069     *:*                                    8708
  UDP    [::]:500               *:*                                    5024
  UDP    [::]:4500              *:*                                    5024
  UDP    [::]:5353              *:*                                    2780
  UDP    [::]:5353              *:*                                    13372
  UDP    [::]:5353              *:*                                    13372
  UDP    [::]:5353              *:*                                    13372
  UDP    [::]:5353              *:*                                    13372
  UDP    [::]:5353              *:*                                    13372
  UDP    [::]:5353              *:*                                    13372
  UDP    [::]:5355              *:*                                    2780
  UDP    [::1]:1900             *:*                                    8708
  UDP    [::1]:56068            *:*                                    8708
  UDP    [fe80::297f:1c43:7984:df29%11]:1900  *:*                                    8708
  UDP    [fe80::297f:1c43:7984:df29%11]:2177  *:*                                    5896
  UDP    [fe80::297f:1c43:7984:df29%11]:56062  *:*                                    8708
  UDP    [fe80::64db:e0f4:68ef:802e%12]:1900  *:*                                    8708
  UDP    [fe80::64db:e0f4:68ef:802e%12]:2177  *:*                                    5896
  UDP    [fe80::64db:e0f4:68ef:802e%12]:56065  *:*                                    8708
  UDP    [fe80::7ccb:2cd4:6558:cf52%25]:1900  *:*                                    8708
  UDP    [fe80::7ccb:2cd4:6558:cf52%25]:2177  *:*                                    5896
  UDP    [fe80::7ccb:2cd4:6558:cf52%25]:56067  *:*                                    8708
  UDP    [fe80::d994:e5f2:2188:19e6%20]:1900  *:*                                    8708
  UDP    [fe80::d994:e5f2:2188:19e6%20]:2177  *:*                                    5896
  UDP    [fe80::d994:e5f2:2188:19e6%20]:56066  *:*                                    8708
  UDP    [fe80::e17a:92f9:dd2b:3e4f%7]:1900  *:*                                    8708
  UDP    [fe80::e17a:92f9:dd2b:3e4f%7]:2177  *:*                                    5896
  UDP    [fe80::e17a:92f9:dd2b:3e4f%7]:56064  *:*                                    8708
  UDP    [fe80::f040:a670:6dcc:b24a%23]:1900  *:*                                    8708
  UDP    [fe80::f040:a670:6dcc:b24a%23]:2177  *:*                                    5896
  UDP    [fe80::f040:a670:6dcc:b24a%23]:56063  *:*                                    8708
```

- déterminer quel programme tourne derrière chacun des ports

```powershell
PS C:\Users\arthu> Get-Process | Where-Object {$_.mainWindowTitle} | Format-Table Id, Name, mainWindowtitle -AutoSize
   Id Name                                                           MainWindowTitle
   -- ----                                                           ---------------
 3868 ApplicationFrameHost                                           Calculator
11492 Calculator                                                     Calculator
13372 chrome                                                         Get-Process - Google Chrome
 3336 Code                                                           ● tp1.md - Untitled (Workspace) - Visual Studio Code
12692 Discord                                                        #📑-cour - Discord
 3568 MicrosoftEdge                                                  Microsoft Edge
 5696 MicrosoftEdgeCP                                                Microsoft Edge
 5792 powershell                                                     Windows PowerShell
 9556 SystemSettings                                                 Paramètres
11780 WindowsInternal.ComposableShell.Experiences.TextInput.InputApp Microsoft Text Input Application


```

- expliquer la fonction de chacun de ces programmes

```powershell
13372 chrome                                                         Get-Process - Google Chrome
```

Chrome est un navigateur web qui tourne sur le port 13372 en UDP.

### Users

- Déterminer la liste des utilisateurs de la machine

- la liste complète des utilisateurs de la machine (je vous vois les Windowsiens...)

```powershell
PS C:\Users\arthu> Get-LocalUser
Name               Enabled Description
----               ------- -----------
Administrateur     False   Compte d’utilisateur d’administration
arthu              True
DefaultAccount     False   Compte utilisateur géré par le système.
Invité             False   Compte d’utilisateur invité
SQLEXPRESS01       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS02       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS03       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS04       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS05       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS06       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS07       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS08       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS09       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS10       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS11       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS12       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS13       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS14       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS15       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS16       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS17       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS18       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS19       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
SQLEXPRESS20       True    Local user account for execution of R scripts in SQL Server instance SQLEXPRESS
WDAGUtilityAccount False   Compte d’utilisateur géré et utilisé par le système pour les scénarios Windows Defender Application Guard.


```

- déterminer le nom de l'utilisateur qui est full admin sur la machine

```powershell
PS C:\Users\arthu> Get-LocalUser
Name               Enabled Description
----               ------- -----------
Administrateur     False   Compte d’utilisateur d’administration
arthu              True
```

### Processus

- Déterminer la liste des processus de la machine

```powershell
PS C:\Users\arthu> tasklist /v
Nom de l’image                 PID Nom de la sessio Numéro de s Utilisation  État            Nom d’utilisateur                                  Temps proces Titre de la fenêtre
========================= ======== ================ =========== ============ =============== ================================================== ============ ========================================================================
System Idle Process              0 Services                   0         8 Ko Unknown         AUTORITE NT\Système                                    17:22:14 N/A
System                           4 Services                   0       732 Ko Unknown         N/A                                                     0:05:03 N/A
Registry                       120 Services                   0    91 328 Ko Unknown         N/A                                                     0:00:00 N/A
smss.exe                       840 Services                   0       528 Ko Unknown         N/A                                                     0:00:00 N/A
csrss.exe                      464 Services                   0     4 176 Ko Unknown         N/A                                                     0:00:01 N/A
wininit.exe                    584 Services                   0     4 972 Ko Unknown         N/A                                                     0:00:00 N/A
csrss.exe                      592 Console                    1     4 888 Ko Running         N/A                                                     0:00:52 N/A
services.exe                   676 Services                   0     8 440 Ko Unknown         N/A                                                     0:03:31 N/A
lsass.exe                      704 Services                   0    16 352 Ko Unknown         N/A                                                     0:00:05 N/A
winlogon.exe                   800 Console                    1    10 304 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                    688 Services                   0     2 780 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                    996 Services                   0    26 060 Ko Unknown         N/A                                                     0:00:10 N/A
WUDFHost.exe                   748 Services                   0     4 928 Ko Unknown         N/A                                                     0:00:00 N/A
fontdrvhost.exe                972 Services                   0     1 432 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   1112 Services                   0    14 272 Ko Unknown         N/A                                                     0:00:12 N/A
fontdrvhost.exe               1120 Console                    1     2 780 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   1180 Services                   0     8 128 Ko Unknown         N/A                                                     0:00:00 N/A
dwm.exe                       1296 Console                    1    84 960 Ko Running         N/A                                                     0:06:11 DWM Notification Window
WUDFHost.exe                  1340 Services                   0    11 912 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   1428 Services                   0     6 936 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   1456 Services                   0     3 668 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   1468 Services                   0     5 852 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   1476 Services                   0     9 840 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   1488 Services                   0     8 304 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   1672 Services                   0     8 016 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   1684 Services                   0     9 852 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   1796 Services                   0    12 164 Ko Unknown         N/A                                                     0:00:01 N/A
svchost.exe                   1856 Services                   0    13 220 Ko Unknown         N/A                                                     0:00:08 N/A
svchost.exe                   1884 Services                   0     6 152 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   1916 Services                   0     5 132 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   2000 Services                   0     4 296 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   2008 Services                   0     9 280 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   1628 Services                   0     5 460 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   2088 Services                   0     5 988 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   2180 Services                   0     7 688 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   2244 Services                   0     5 620 Ko Unknown         N/A                                                     0:00:01 N/A
svchost.exe                   2280 Services                   0     8 020 Ko Unknown         N/A                                                     0:00:02 N/A
igfxCUIService.exe            2352 Services                   0     6 148 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   2372 Services                   0     4 824 Ko Unknown         N/A                                                     0:00:00 N/A
NVDisplay.Container.exe       2480 Services                   0    12 028 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   2508 Services                   0     4 144 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   2548 Services                   0     5 016 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   2660 Services                   0     8 696 Ko Unknown         N/A                                                     0:00:01 N/A
svchost.exe                   2764 Services                   0     9 264 Ko Unknown         N/A                                                     0:00:01 N/A
svchost.exe                   2780 Services                   0     6 720 Ko Unknown         N/A                                                     0:00:05 N/A
svchost.exe                   2800 Services                   0     5 856 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   2832 Services                   0    12 124 Ko Unknown         N/A                                                     0:00:06 N/A
svchost.exe                   3056 Services                   0    11 572 Ko Unknown         N/A                                                     0:00:15 N/A
svchost.exe                   1996 Services                   0     4 244 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   2164 Services                   0     7 012 Ko Unknown         N/A                                                     0:00:01 N/A
svchost.exe                   2176 Services                   0     6 408 Ko Unknown         N/A                                                     0:00:00 N/A
Memory Compression            2868 Services                   0   317 124 Ko Unknown         N/A                                                     0:00:33 N/A
svchost.exe                   3080 Services                   0     5 416 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   3088 Services                   0     5 692 Ko Unknown         N/A                                                     0:00:00 N/A
NVDisplay.Container.exe       3396 Console                    1    27 868 Ko Running         N/A                                                     0:00:05 NvSvc
svchost.exe                   3412 Services                   0    11 480 Ko Unknown         N/A                                                     0:00:02 N/A
audiodg.exe                   3528 Services                   0    25 160 Ko Unknown         N/A                                                     0:06:20 N/A
svchost.exe                   3576 Services                   0     7 636 Ko Unknown         N/A                                                     0:00:01 N/A
svchost.exe                   3584 Services                   0     4 804 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   3764 Services                   0    15 092 Ko Unknown         N/A                                                     0:00:02 N/A
svchost.exe                   3856 Services                   0    16 740 Ko Unknown         N/A                                                     0:00:03 N/A
svchost.exe                   3900 Services                   0     9 336 Ko Unknown         N/A                                                     0:00:00 N/A
AsLdrSrv64.exe                3908 Services                   0     4 056 Ko Unknown         N/A                                                     0:00:00 N/A
wlanext.exe                   4040 Services                   0     4 744 Ko Unknown         N/A                                                     0:00:00 N/A
conhost.exe                   3164 Services                   0     4 032 Ko Unknown         N/A                                                     0:00:00 N/A
spoolsv.exe                   3324 Services                   0     8 968 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   3544 Services                   0    11 148 Ko Unknown         N/A                                                     0:00:02 N/A
Intel_PIE_Service.exe         4216 Services                   0     5 924 Ko Unknown         N/A                                                     0:00:00 N/A
WmiPrvSE.exe                  4312 Services                   0     8 712 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   4484 Services                   0     5 668 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   4592 Services                   0     6 640 Ko Unknown         N/A                                                     0:00:00 N/A
AsHidSrv64.exe                4840 Services                   0     2 284 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   4848 Services                   0    21 072 Ko Unknown         N/A                                                     0:00:02 N/A
AsusSystemAnalysis.exe        4856 Services                   0     8 408 Ko Unknown         N/A                                                     0:00:00 N/A
AsusLiveUpdateAgent.exe       4864 Services                   0    13 376 Ko Unknown         N/A                                                     0:00:01 N/A
svchost.exe                   4896 Services                   0    38 996 Ko Unknown         N/A                                                     0:00:12 N/A
svchost.exe                   4912 Services                   0     8 728 Ko Unknown         N/A                                                     0:00:00 N/A
nvcontainer.exe               4920 Services                   0    26 004 Ko Unknown         N/A                                                     0:00:02 N/A
OneApp.IGCC.WinService.ex     4928 Services                   0    23 160 Ko Unknown         N/A                                                     0:00:00 N/A
ASUSOptimization.exe          4936 Services                   0     4 952 Ko Unknown         N/A                                                     0:00:00 N/A
RtkAudUService64.exe          4948 Services                   0     6 652 Ko Unknown         N/A                                                     0:00:00 N/A
ICEsoundService64.exe         4964 Services                   0     5 020 Ko Unknown         N/A                                                     0:00:02 N/A
OfficeClickToRun.exe          4976 Services                   0    29 516 Ko Unknown         N/A                                                     0:00:01 N/A
svchost.exe                   4988 Services                   0    11 888 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   4996 Services                   0     3 756 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   5012 Services                   0     4 404 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   5024 Services                   0     5 520 Ko Unknown         N/A                                                     0:00:00 N/A
DSAService.exe                5052 Services                   0    36 208 Ko Unknown         N/A                                                     0:00:03 N/A
IntelAudioService.exe         5060 Services                   0    24 904 Ko Unknown         N/A                                                     0:00:01 N/A
AsusSystemDiagnosis.exe       5068 Services                   0     3 836 Ko Unknown         N/A                                                     0:00:00 N/A
esif_uf.exe                   5080 Services                   0     3 836 Ko Unknown         N/A                                                     0:00:00 N/A
SurSvc.exe                    5088 Services                   0    29 960 Ko Unknown         N/A                                                     0:00:00 N/A
jhi_service.exe               5100 Services                   0     4 456 Ko Unknown         N/A                                                     0:00:00 N/A
ibtsiva.exe                   5108 Services                   0     2 820 Ko Unknown         N/A                                                     0:00:00 N/A
sqlwriter.exe                 5116 Services                   0     5 508 Ko Unknown         N/A                                                     0:00:00 N/A
RstMwService.exe              4236 Services                   0     4 824 Ko Unknown         N/A                                                     0:00:00 N/A
IntelCpHDCPSvc.exe            2208 Services                   0     5 404 Ko Unknown         N/A                                                     0:00:00 N/A
IntelCpHeciSvc.exe            4320 Services                   0     4 972 Ko Unknown         N/A                                                     0:00:00 N/A
vmware-authd.exe              4340 Services                   0     8 640 Ko Unknown         N/A                                                     0:00:26 N/A
vmnetdhcp.exe                 4468 Services                   0     2 820 Ko Unknown         N/A                                                     0:00:00 N/A
vmware-usbarbitrator64.ex     4540 Services                   0     8 716 Ko Unknown         N/A                                                     0:00:00 N/A
vmnat.exe                     4644 Services                   0     4 848 Ko Unknown         N/A                                                     0:00:00 N/A
MsMpEng.exe                   4652 Services                   0   139 256 Ko Unknown         N/A                                                     0:02:21 N/A
svchost.exe                   4684 Services                   0    17 452 Ko Unknown         N/A                                                     0:00:00 N/A
sqlceip.exe                   5152 Services                   0    40 748 Ko Unknown         N/A                                                     0:00:01 N/A
sqlservr.exe                  5160 Services                   0   108 376 Ko Unknown         N/A                                                     0:05:50 N/A
ReportingServicesService.     5168 Services                   0   110 940 Ko Unknown         N/A                                                     0:00:10 N/A
svchost.exe                   5416 Services                   0     6 956 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   5484 Services                   0     3 672 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   5624 Services                   0     8 760 Ko Unknown         N/A                                                     0:00:00 N/A
Microsoft.ReportingServic     2904 Services                   0    42 668 Ko Unknown         N/A                                                     0:00:02 N/A
rundll32.exe                  6796 Console                    1     5 440 Ko Running         N/A                                                     0:00:00 RxDiag Message Pump 2020 NVIDIA Corporation Mar  9 2020 19:47:05
conhost.exe                   4512 Services                   0     5 100 Ko Unknown         N/A                                                     0:00:00 N/A
DSAUpdateService.exe          7860 Services                   0    36 652 Ko Unknown         N/A                                                     0:00:01 N/A
Launchpad.exe                 8000 Services                   0    13 224 Ko Unknown         N/A                                                     0:00:00 N/A
fdlauncher.exe                8112 Services                   0     3 692 Ko Unknown         N/A                                                     0:00:00 N/A
fdhost.exe                    7320 Services                   0     4 060 Ko Unknown         N/A                                                     0:00:00 N/A
conhost.exe                   7176 Services                   0     3 804 Ko Unknown         N/A                                                     0:00:00 N/A
SearchIndexer.exe             7660 Services                   0    29 532 Ko Unknown         N/A                                                     0:00:07 N/A
AsMonStartupTask64.exe        8512 Console                    1     9 628 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 ASUS AsMonStartupTask App
svchost.exe                   8640 Services                   0    14 992 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   8708 Services                   0     5 096 Ko Unknown         N/A                                                     0:00:00 N/A
nvcontainer.exe               8860 Console                    1    25 576 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:09 BroadcastListenerWindow
sihost.exe                    8968 Console                    1    23 072 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:04 N/A
svchost.exe                   9020 Console                    1    23 528 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:53 N/A
svchost.exe                   9028 Console                    1     5 800 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
PresentationFontCache.exe     9068 Services                   0    13 072 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   9100 Console                    1    35 840 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:01 Windows Push Notifications Platform
svchost.exe                   8600 Services                   0    14 244 Ko Unknown         N/A                                                     0:00:02 N/A
taskhostw.exe                 1400 Console                    1    12 032 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:01 Task Host Window
svchost.exe                   4756 Services                   0     5 872 Ko Unknown         N/A                                                     0:00:00 N/A
ctfmon.exe                     988 Console                    1    12 476 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:33 N/A
igfxEM.exe                    9108 Console                    1    14 012 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 The Event Manager Dashboard
explorer.exe                  9452 Console                    1   130 096 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:01:41 N/A
svchost.exe                   9536 Services                   0    15 288 Ko Unknown         N/A                                                     0:00:00 N/A
NisSrv.exe                    9764 Services                   0     9 320 Ko Unknown         N/A                                                     0:00:02 N/A
svchost.exe                  10124 Console                    1    19 708 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:03 N/A
NVIDIA Web Helper.exe         4792 Console                    1     1 992 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:03 NVIDIA NodeJS Share Window
StartMenuExperienceHost.e    10516 Console                    1    44 808 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:02 Démarrer
TSVNCache.exe                10532 Console                    1     7 680 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 TSVNCacheWindow
RuntimeBroker.exe            10740 Console                    1    19 928 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:01 N/A
SearchUI.exe                 10948 Console                    1    79 900 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:09 Cortana
RuntimeBroker.exe            10176 Console                    1    35 580 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:03 N/A
dllhost.exe                   9584 Services                   0     8 344 Ko Unknown         N/A                                                     0:00:00 N/A
SettingSyncHost.exe          11296 Console                    1     5 020 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:01 N/A
SecurityHealthSystray.exe    11760 Console                    1     6 404 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
SecurityHealthService.exe    11880 Services                   0    11 292 Ko Unknown         N/A                                                     0:00:00 N/A
conhost.exe                   9240 Console                    1     1 060 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
svchost.exe                  11104 Services                   0     7 372 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                  11528 Services                   0    17 264 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                  12012 Services                   0     8 960 Ko Unknown         N/A                                                     0:00:00 N/A
HControl.exe                 12024 Console                    1     4 960 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 HControl
jusched.exe                  12252 Console                    1     4 976 Ko Not Responding  LAPTOP-T6GHI3P2\arthu                                   0:00:00 OleMainThreadWndName
RuntimeBroker.exe             6892 Console                    1    15 328 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:02 N/A
Discord.exe                  12692 Console                    1    58 012 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:02:11 #📑-cour - Discord
Discord.exe                  13228 Console                    1   119 744 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:01:57 N/A
Discord.exe                   3052 Console                    1    21 800 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:07 N/A
RtkAudUService64.exe           600 Console                    1     1 036 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 RealtekAudioBackgroundProcessClass
Discord.exe                  13424 Console                    1     8 024 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
Discord.exe                  13876 Console                    1   230 356 Ko Running         LAPTOP-T6GHI3P2\arthu                                   1:09:10 OLEChannelWnd
chrome.exe                   13372 Console                    1   222 784 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:06:27 Get-Process - Google Chrome
chrome.exe                   12624 Console                    1     4 988 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
chrome.exe                   13660 Console                    1     6 452 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
chrome.exe                   13828 Console                    1   263 128 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:03:42 N/A
CompPkgSrv.exe               10988 Console                    1     6 828 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
chrome.exe                   10160 Console                    1    43 536 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:33 N/A
chrome.exe                   13508 Console                    1   126 112 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:20 N/A
chrome.exe                   14484 Console                    1    24 304 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
Discord.exe                  15196 Console                    1    14 436 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:01 N/A
chrome.exe                   13300 Console                    1    83 784 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:54 N/A
ApplicationFrameHost.exe      3868 Console                    1    22 084 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 Calculator
MicrosoftEdge.exe             3568 Console                    1     3 188 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 Microsoft Edge
browser_broker.exe            4444 Console                    1     6 696 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 OleMainThreadWndName
RuntimeBroker.exe             5536 Console                    1     6 208 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
MicrosoftEdgeCP.exe           5696 Console                    1    18 484 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 Microsoft Edge
MicrosoftEdgeSH.exe           5872 Console                    1     8 632 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
IAStorIcon.exe                7216 Console                    1    35 156 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
ATKOSD2.exe                   4640 Console                    1     9 440 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 ATKOSD2
SystemSettings.exe            9556 Console                    1       140 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 Paramètres
svchost.exe                   5020 Services                   0     9 308 Ko Unknown         N/A                                                     0:00:00 N/A
Calculator.exe               11492 Console                    1       268 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 Calculator
svchost.exe                   1372 Services                   0    12 552 Ko Unknown         N/A                                                     0:00:04 N/A
esrv_svc.exe                  2980 Services                   0    33 528 Ko Unknown         N/A                                                     0:01:56 N/A
svchost.exe                   2112 Services                   0    10 320 Ko Unknown         N/A                                                     0:00:03 N/A
svchost.exe                   4508 Console                    1     9 360 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
GoogleCrashHandler.exe        1464 Services                   0     1 128 Ko Unknown         N/A                                                     0:00:00 N/A
GoogleCrashHandler64.exe     14284 Services                   0     1 080 Ko Unknown         N/A                                                     0:00:00 N/A
IAStorDataMgrSvc.exe         14492 Services                   0    64 996 Ko Unknown         N/A                                                     0:00:01 N/A
SgrmBroker.exe               14324 Services                   0     5 184 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                  14260 Services                   0    12 024 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                  13344 Services                   0     7 644 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                   5896 Services                   0     5 716 Ko Unknown         N/A                                                     0:00:00 N/A
ShellExperienceHost.exe       4888 Console                    1    45 364 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:01 Liste de raccourcis pour Discord
RuntimeBroker.exe            14112 Console                    1    20 728 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 OleMainThreadWndName
YourPhone.exe                11476 Console                    1       336 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
RuntimeBroker.exe             5240 Console                    1     7 180 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
Code.exe                      3336 Console                    1    66 532 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:03:22 tp1.md - Untitled (Workspace) - Visual Studio Code
Code.exe                      7728 Console                    1   147 420 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:02:50 N/A
Code.exe                      1404 Console                    1    22 612 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
Code.exe                      8400 Console                    1   203 796 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:12:36 N/A
Code.exe                      3524 Console                    1    57 932 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:08 N/A
Code.exe                     11820 Console                    1    11 440 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
Code.exe                      2812 Console                    1    88 052 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:01:16 N/A
CodeHelper.exe                 628 Console                    1    12 180 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
conhost.exe                   1396 Console                    1     5 192 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
conhost.exe                  10572 Services                   0     5 568 Ko Unknown         N/A                                                     0:00:00 N/A
esrv.exe                      3316 Console                    1    17 620 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:15 N/A
WindowsInternal.Composabl    11780 Console                    1    37 724 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:03 Microsoft Text Input Application
powershell.exe                5792 Console                    1   136 368 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:12 Windows PowerShell
conhost.exe                   2640 Console                    1    16 652 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:32 N/A
svchost.exe                   8044 Services                   0    14 960 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                  10040 Services                   0    13 408 Ko Unknown         N/A                                                     0:00:02 N/A
dllhost.exe                  16200 Console                    1     9 432 Ko Running         LAPTOP-T6GHI3P2\arthu                                   0:00:00 OleMainThreadWndName
chrome.exe                   11192 Console                    1    14 512 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:03 N/A
svchost.exe                  10164 Services                   0     7 208 Ko Unknown         N/A                                                     0:00:00 N/A
unsecapp.exe                  6260 Services                   0     6 536 Ko Unknown         N/A                                                     0:00:00 N/A
chrome.exe                   20384 Console                    1    83 744 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:24 N/A
chrome.exe                   19892 Console                    1   119 572 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:25 N/A
chrome.exe                   19016 Console                    1    88 752 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:06 N/A
chrome.exe                   18532 Console                    1    90 916 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:05 N/A
WmiPrvSE.exe                 17168 Services                   0    10 956 Ko Unknown         N/A                                                     0:00:07 N/A
chrome.exe                    2716 Console                    1    60 112 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
chrome.exe                   18248 Console                    1    22 448 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
SearchProtocolHost.exe       18940 Services                   0    12 208 Ko Unknown         N/A                                                     0:00:00 N/A
svchost.exe                  18392 Services                   0     7 836 Ko Unknown         N/A                                                     0:00:00 N/A
SearchFilterHost.exe         18868 Services                   0     6 220 Ko Unknown         N/A                                                     0:00:00 N/A
chrome.exe                   14840 Console                    1    49 392 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:01 N/A
tasklist.exe                  5688 Console                    1     9 416 Ko Unknown         LAPTOP-T6GHI3P2\arthu                                   0:00:00 N/A
```

- choisissez 5 services système et expliquer leur utilité

wininit.exe : c'est le programme de lancement de l'OS.

System Idle Process : c'est le programme qui tourne quand l'ordinateur n'a rien de mieux a faire.

System : c'est un programme qui se lance quand vous allumez votre PC.

smss.exe : c'est le programme de gestionnaire de session du sous-système, il gère toutes les app au démarrages.

csrss.exe : c'est un programme qui sert à gérer les fenêtres et les éléments graphiques de Windows.

- déterminer les processus lancés par l'utilisateur qui est full admin sur la machine

## Scripting

- Script 1 : [lien](script1.bat)

- Script 2 : [lien](script2.bat)

### Gestion de softs

- Expliquer l'intérêt de l'utilisation d'un gestionnaire de paquets

L'intérêt d'utiliser un gestionnaire de paquets pour le téléchargement sur internet est la sécurité ajouté par le téléchargement en direct. Aussi, cela nous permet d'être sûr que nous recevons bien le paquets qu'on veut télécharger. Les gestionnaire de paquets ont aussi des mesure de sécurité pour le téléchargement.

- Utiliser un gestionnaire de paquet propres à votre OS pour

  - lister tous les paquets déjà installés

```powershell
PS C:\Users\arthu> choco list -li
Chocolatey v0.10.15
chocolatey 0.10.15
chocolatey-core.extension 1.3.5.1
chocolatey-dotnetfx.extension 1.0.1
chocolatey-visualstudio.extension 1.8.1
chocolatey-windowsupdate.extension 1.0.4
dotnetfx 4.8.0.20190930
KB2919355 1.0.20160915
KB2919442 1.0.20160915
KB2999226 1.0.20181019
KB3033929 1.0.5
KB3035131 1.0.3
python2 2.7.17
vcredist140 14.24.28127.4
visualstudio-installer 2.0.1
visualstudio2017buildtools 15.9.21.0
15 packages installed.

Active Directory Authentication Library pour SQL Server|14.0.800.90
Adobe Creative Cloud|5.1.0.407
AudioWizard|1.0.12.1
Badlion Client 2.11.3|2.11.3
Blitz 1.8.0|1.8.0
BlueStacks App Player|4.190.0.5002
Browser pour SQL Server 2016|13.1.4001.0
CodeBlocks|17.12
Discord|0.0.306
Enregistreur VSS Microsoft pour SQL Server 2016|13.1.4001.0
Epic Games Launcher|1.1.220.0
f.lux|
Fichiers de support d installation de Microsoft SQL Server 2008|10.3.5500.0
GIMP 2.10.12|2.10.12
Git version 2.23.0.windows.1|2.23.0.windows.1
GitHub Desktop|2.2.4
GNS3|2.2.5
Google Chrome|81.0.4044.129
Intel(R) Computing Improvement Program|2.4.05718
Intel(R) Processor Graphics|26.20.100.8141
Intel(R) Rapid Storage Technology|16.8.2.1002
Intel(R) Wireless Bluetooth(R)|21.80.0.3
Intel® Driver &amp; Support Assistant|20.4.17.5
Intel® OptaneT Pinning Explorer Extensions|16.8.2.1002
Intel® PROSet/Wireless Software|20.80.0.0u
IntelliJ IDEA 2019.2.4|192.7142.36
Java 8 Update 251 (64-bit)|8.0.2510.8
JetBrains PhpStorm 2019.2.4|192.7142.41
League of Legends|
Legends of Runeterra|
Microsoft .NET Framework 4.5 Multi-Targeting Pack|4.5.50710
Microsoft .NET Framework 4.5.1 Multi-Targeting Pack|4.5.50932
Microsoft .NET Framework 4.5.1 Multi-Targeting Pack (Français)|4.5.50932
Microsoft .NET Framework 4.5.1 SDK|4.5.51641
Microsoft .NET Framework 4.5.1 SDK (Français)|4.5.51641
Microsoft .NET Framework 4.5.2 Multi-Targeting Pack|4.5.51209
Microsoft .NET Framework 4.5.2 Multi-Targeting Pack (Français)|4.5.51209
Microsoft Help Viewer 1.1|1.1.40219
Microsoft Help Viewer 1.1 Language Pack - FRA|1.1.40219
Microsoft Help Viewer 2.2|2.2.23107
Microsoft MPI (7.0.12437.8)|7.0.12437.8
Microsoft ODBC Driver 13 for SQL Server|14.0.800.90
Microsoft Office 365 ProPlus - fr-fr|16.0.12527.20442
Microsoft OneDrive|19.232.1124.0012
Microsoft SQL Server 2012 Native Client |11.3.6518.0
Microsoft SQL Server 2016 (64-bit)|
Microsoft SQL Server 2016 Setup (English)|13.1.4259.0
Microsoft SQL Server 2016 T-SQL Language Service |13.0.14500.10
Microsoft SQL Server 2017 RC1|
Microsoft SQL Server Data-Tier Application Framework (x86) - fr-FR|14.0.3757.2
Microsoft SQL Server Management Studio - 17.2|14.0.17177.0
Microsoft SQL Server 2014 Management Objects |12.0.2000.8
Microsoft SQL Server 2016 T-SQL ScriptDom|13.1.4001.0
Microsoft System CLR Types pour SQL Server 2017 RC1|14.0.800.90
Microsoft System CLR Types pour SQL Server 2014|12.0.2402.11
Microsoft Teams|1.3.00.8663
Microsoft Visual C++ 2008 Redistributable - x64 9.0.30729.4148|9.0.30729.4148
Microsoft Visual C++ 2008 Redistributable - x64 9.0.30729.6161|9.0.30729.6161
Microsoft Visual C++ 2008 Redistributable - x86 9.0.30729.4148|9.0.30729.4148
Microsoft Visual C++ 2008 Redistributable - x86 9.0.30729.6161|9.0.30729.6161
Microsoft Visual C++ 2010  x64 Redistributable - 10.0.40219|10.0.40219
Microsoft Visual C++ 2010  x86 Redistributable - 10.0.40219|10.0.40219
Microsoft Visual C++ 2012 Redistributable (x64) - 11.0.61030|11.0.61030.0
Microsoft Visual C++ 2012 Redistributable (x86) - 11.0.61030|11.0.61030.0
Microsoft Visual C++ 2013 Redistributable (x64) - 12.0.21005|12.0.21005.1
Microsoft Visual C++ 2013 Redistributable (x64) - 12.0.40660|12.0.40660.0
Microsoft Visual C++ 2013 Redistributable (x86) - 12.0.21005|12.0.21005.1
Microsoft Visual C++ 2013 Redistributable (x86) - 12.0.21005|12.0.21005.1
Microsoft Visual C++ 2013 Redistributable (x86) - 12.0.40660|12.0.40660.0
Microsoft Visual C++ 2015-2019 Redistributable (x64) - 14.24.28127|14.24.28127.4
Microsoft Visual C++ 2015-2019 Redistributable (x86) - 14.23.27820|14.23.27820.0
Microsoft Visual Studio Code (User)|1.44.2
Microsoft Visual Studio Installer|1.18.1104.625
Minecraft Launcher|1.0.0.0
Module linguistique Microsoft Help Viewer 2.2 - FRA|2.2.23107
Mozilla Firefox 75.0 (x64 fr)|75.0
Mozilla Maintenance Service|69.0.2
Nmap 7.80|7.80
Node.js|12.16.1
Npcap 0.9983|0.9983
NVIDIA GeForce Experience 3.20.3.63|3.20.3.63
NVIDIA Logiciel système PhysX 9.19.0218|9.19.0218
NVIDIA Pilote graphique 445.87|445.87
Oracle VM VirtualBox 6.1.4|6.1.4
Overwolf|0.142.0.22
Prise en charge linguistique de Microsoft Visual Studio Tools for Applications 2015|14.0.23107.20
Python 3.7.6 (64-bit)|3.7.6150.0
Python Launcher|3.7.6925.0
Service de langage T-SQL Microsoft SQL Server 2017 RC1|14.0.17177.0
Stratégies Microsoft SQL Server 2017 RC1|14.0.800.90
Teams Machine-Wide Installer|1.2.0.17057
TFTactics|0.3.8
TortoiseSVN 1.13.1.28686 (64 bit)|1.13.28686
VMware VIX|1.15.0.00000
Wampserver64 3.1.9|3.1.9
Windows SDK AddOn|10.1.0.0
Windows Software Development Kit - Windows 10.0.17763.132|10.1.17763.132
WinRAR 5.70 (32-bit)|5.70.0
Wireshark 3.0.6 64-bit|3.0.6
XAMPP|7.4.5-0
100 applications not managed with Chocolatey.
```

- déterminer la provenance des paquets (= quel serveur nous délivre les paquets lorsqu'on installe quelque chose)

## Partage de fichiers

## Chiffrement et notion de confiance

- Expliquer en détail l'utilisation de certificats

L'information principal d'un certificat et la clé publique, le certificat et aussi infalsifiable : il est chiffré pour empêcher toute modification, nominatif : il est délivré à une entité (comme la carte d’identité est délivrée à une personne et une seule) et certifié : il y a le « tampon » de l’autorité qui l’a délivré.

Tous sa permet donc aux cetificats d'être sécurisé.

### Chiffrement de mails

### TLS

### SSH

### SSH avancé

### SSH tunnels

### SSH jumps

## Forwarding de ports at home
