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
PS C:\Users\arthu> Get-ComputerInfo


```

```powershell
PS C:\Users\arthu> Get-ComputerInfo

WindowsBuildLabEx                                       : 18362.1.amd64fre.19h1_release.190318-1202
WindowsCurrentVersion                                   : 6.3
WindowsEditionId                                        : Core
WindowsInstallationType                                 : Client
WindowsInstallDateFromRegistry                          : 26/08/2019 14:53:14
WindowsProductId                                        : 00325-96543-85804-AAOEM
WindowsProductName                                      : Windows 10 Home
WindowsRegisteredOrganization                           :
WindowsRegisteredOwner                                  : arthur.laforest33@outlook.com
WindowsSystemRoot                                       : C:\WINDOWS
WindowsVersion                                          : 1909
BiosCharacteristics                                     : {7, 11, 12, 15...}
BiosBIOSVersion                                         : {_ASUS_ - 1072009, X530FN.305, American Megatrends
                                                          - 5000D}
BiosBuildNumber                                         :
BiosCaption                                             : X530FN.305
BiosCodeSet                                             :
BiosCurrentLanguage                                     : en|US|iso8859-1
BiosDescription                                         : X530FN.305
BiosEmbeddedControllerMajorVersion                      : 255
BiosEmbeddedControllerMinorVersion                      : 255
BiosFirmwareType                                        : Uefi
BiosIdentificationCode                                  :
BiosInstallableLanguages                                : 1
BiosInstallDate                                         :
BiosLanguageEdition                                     :
BiosListOfLanguages                                     : {en|US|iso8859-1}
BiosManufacturer                                        : American Megatrends Inc.
BiosName                                                : X530FN.305
BiosOtherTargetOS                                       :
BiosPrimaryBIOS                                         : True
BiosReleaseDate                                         : 30/05/2019 02:00:00
BiosSeralNumber                                         : K3N0CX05X63812F
BiosSMBIOSBIOSVersion                                   : X530FN.305
BiosSMBIOSMajorVersion                                  : 3
BiosSMBIOSMinorVersion                                  : 2
BiosSMBIOSPresent                                       : True
BiosSoftwareElementState                                : Running
BiosStatus                                              : OK
BiosSystemBiosMajorVersion                              : 5
BiosSystemBiosMinorVersion                              : 13
BiosTargetOperatingSystem                               : 0
BiosVersion                                             : _ASUS_ - 1072009
CsAdminPasswordStatus                                   : Unknown
CsAutomaticManagedPagefile                              : True
CsAutomaticResetBootOption                              : True
CsAutomaticResetCapability                              : True
CsBootOptionOnLimit                                     :
CsBootOptionOnWatchDog                                  :
CsBootROMSupported                                      : True
CsBootStatus                                            : {0, 0, 0, 0...}
CsBootupState                                           : Normal boot
CsCaption                                               : LAPTOP-T6GHI3P2
CsChassisBootupState                                    : Safe
CsChassisSKUNumber                                      : NA
CsCurrentTimeZone                                       : 120
CsDaylightInEffect                                      : True
CsDescription                                           : AT/AT COMPATIBLE
CsDNSHostName                                           : LAPTOP-T6GHI3P2
CsDomain                                                : WORKGROUP
CsDomainRole                                            : StandaloneWorkstation
CsEnableDaylightSavingsTime                             : True
CsFrontPanelResetStatus                                 : Unknown
CsHypervisorPresent                                     : False
CsInfraredSupported                                     : False
CsInitialLoadInfo                                       :
CsInstallDate                                           :
CsKeyboardPasswordStatus                                : Unknown
CsLastLoadInfo                                          :
CsManufacturer                                          : ASUSTeK COMPUTER INC.
CsModel                                                 : VivoBook_ASUSLaptop X530FN_S530FN
CsName                                                  : LAPTOP-T6GHI3P2
CsNetworkAdapters                                       : {Wi-Fi, Connexion réseau Bluetooth, VirtualBox
                                                          Host-Only Network, VMware Network Adapter VMnet1...}
CsNetworkServerModeEnabled                              : True
CsNumberOfLogicalProcessors                             : 8
CsNumberOfProcessors                                    : 1
CsProcessors                                            : {Intel(R) Core(TM) i7-8565U CPU @ 1.80GHz}
CsOEMStringArray                                        : {kPJ-+7X7+EfTa, jTyRUBSNi7Ydf, fCrOzJ6x1i-eh,  ...}
CsPartOfDomain                                          : False
CsPauseAfterReset                                       : -1
CsPCSystemType                                          : Mobile
CsPCSystemTypeEx                                        : Mobile
CsPowerManagementCapabilities                           :
CsPowerManagementSupported                              :
CsPowerOnPasswordStatus                                 : Unknown
CsPowerState                                            : Unknown
CsPowerSupplyState                                      : Safe
CsPrimaryOwnerContact                                   :
CsPrimaryOwnerName                                      : arthur.laforest33@outlook.com
CsResetCapability                                       : Other
CsResetCount                                            : -1
CsResetLimit                                            : -1
CsRoles                                                 : {LM_Workstation, LM_Server, SQLServer, NT}
CsStatus                                                : OK
CsSupportContactDescription                             :
CsSystemFamily                                          : VivoBook
CsSystemSKUNumber                                       :
CsSystemType                                            : x64-based PC
CsThermalState                                          : Safe
CsTotalPhysicalMemory                                   : 8434085888
CsPhyicallyInstalledMemory                              : 8388608
CsUserName                                              : LAPTOP-T6GHI3P2\arthu
CsWakeUpType                                            : PowerSwitch
CsWorkgroup                                             : WORKGROUP
OsName                                                  : Microsoft Windows 10 Famille
OsType                                                  : WINNT
OsOperatingSystemSKU                                    : WindowsHome
OsVersion                                               : 10.0.18363
OsCSDVersion                                            :
OsBuildNumber                                           : 18363
OsHotFixes                                              : {KB4537572, KB4503308, KB4508433, KB4515383...}
OsBootDevice                                            : \Device\HarddiskVolume2
OsSystemDevice                                          : \Device\HarddiskVolume4
OsSystemDirectory                                       : C:\WINDOWS\system32
OsSystemDrive                                           : C:
OsWindowsDirectory                                      : C:\WINDOWS
OsCountryCode                                           : 33
OsCurrentTimeZone                                       : 120
OsLocaleID                                              : 040c
OsLocale                                                : fr-FR
OsLocalDateTime                                         : 14/04/2020 16:14:40
OsLastBootUpTime                                        : 14/04/2020 08:41:47
OsUptime                                                : 07:32:52.8161995
OsBuildType                                             : Multiprocessor Free
OsCodeSet                                               : 1252
OsDataExecutionPreventionAvailable                      : True
OsDataExecutionPrevention32BitApplications              : True
OsDataExecutionPreventionDrivers                        : True
OsDataExecutionPreventionSupportPolicy                  : OptIn
OsDebug                                                 : False
OsDistributed                                           : False
OsEncryptionLevel                                       : 256
OsForegroundApplicationBoost                            : Maximum
OsTotalVisibleMemorySize                                : 8236412
OsFreePhysicalMemory                                    : 3563572
OsTotalVirtualMemorySize                                : 12692860
OsFreeVirtualMemory                                     : 5000432
OsInUseVirtualMemory                                    : 7692428
OsTotalSwapSpaceSize                                    :
OsSizeStoredInPagingFiles                               : 4456448
OsFreeSpaceInPagingFiles                                : 4373460
OsPagingFiles                                           : {C:\pagefile.sys}
OsHardwareAbstractionLayer                              : 10.0.18362.752
OsInstallDate                                           : 26/08/2019 16:53:14
OsManufacturer                                          : Microsoft Corporation
OsMaxNumberOfProcesses                                  : 4294967295
OsMaxProcessMemorySize                                  : 137438953344
OsMuiLanguages                                          : {fr-FR, en-GB, en-US, it-IT...}
OsNumberOfLicensedUsers                                 :
OsNumberOfProcesses                                     : 219
OsNumberOfUsers                                         : 22
OsOrganization                                          :
OsArchitecture                                          : 64 bits
OsLanguage                                              : fr-FR
OsProductSuites                                         : {TerminalServicesSingleSession, HomeEdition}
OsOtherTypeDescription                                  :
OsPAEEnabled                                            :
OsPortableOperatingSystem                               : False
OsPrimary                                               : True
OsProductType                                           : WorkStation
OsRegisteredUser                                        : arthur.laforest33@outlook.com
OsSerialNumber                                          : 00325-96543-85804-AAOEM
OsServicePackMajorVersion                               : 0
OsServicePackMinorVersion                               : 0
OsStatus                                                : OK
OsSuites                                                : {TerminalServices, TerminalServicesSingleSession,
                                                          HomeEdition}
OsServerLevel                                           :
KeyboardLayout                                          : fr-FR
TimeZone                                                : (UTC+01:00) Bruxelles, Copenhague, Madrid, Paris
LogonServer                                             : \\LAPTOP-T6GHI3P2
PowerPlatformRole                                       : Mobile
HyperVisorPresent                                       : False
HyperVRequirementDataExecutionPreventionAvailable       : True
HyperVRequirementSecondLevelAddressTranslation          : True
HyperVRequirementVirtualizationFirmwareEnabled          : True
HyperVRequirementVMMonitorModeExtensions                : True
DeviceGuardSmartStatus                                  : Off
DeviceGuardRequiredSecurityProperties                   :
DeviceGuardAvailableSecurityProperties                  :
DeviceGuardSecurityServicesConfigured                   :
DeviceGuardSecurityServicesRunning                      :
DeviceGuardCodeIntegrityPolicyEnforcementStatus         :
DeviceGuardUserModeCodeIntegrityPolicyEnforcementStatus :
```
