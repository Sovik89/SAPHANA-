SAP HANA DB System Installation Steps 
SAP HANA System Concepts
An SAP HANA system is composed of three main components: the host, the system, and the instance.
 
Host
A host is the operating environment in which the SAP HANA database runs. The host provides all the resources and services (CPU, memory, network, and operating system) that the SAP HANA database requires. The storage for an installation does not have to be on the host. For multiple-host systems, a shared storage or a storage that is accessible on-demand from all hosts is required.
For more information about the restrictions that apply to host names in SAP systems, see SAP Note 611361 in Related Information.
Instance (HDB)
An SAP HANA instance (HDB) is the smallest operational unit on a host. It is the set of SAP HANA system components that are installed on one host. A single-host system contains one instance on the one host. A multiple-host system contains several instances distributed across the multiple hosts (one per host). Every system has an instance number, which is a two-digit identifier. Each instance in a multiple-host system must have the same instance number.
System
A system is one or more instances with the same number. The term "system" is interchangeable with the term "SAP HANA database". If a system has more than one instance, they must be dispersed over several hosts as a multiple-host system. Every system has a unique SAP system ID (SID).

SAP HANA System Types
An SAP HANA system can be configured as a single-host or multiple-host system using the SAP HANA database lifecycle manager.
The SAP HANA system type definitions are as follows:
•	Single-host system - One SAP HANA instance on one host.
•	Multiple-host (distributed) system - Multiple SAP HANA instances distributed over multiple hosts, with one instance per host.
A single-host system is the simplest system installation type. It is possible to run an SAP HANA system entirely on one host and then scale the system up as needed. The SAP HANA database lifecycle manager can be used to install an SAP HANA single-host system in one of the program interfaces, and with a combination of parameter specification methods.
The following graphic shows the file system for a single-host installation:
 
A multiple-host system is a system with more than one host, which can be configured as active worker hosts or idle standby hosts. The SAP HANA database lifecycle manager can be used to install an SAP HANA multiple-host system in one of the program interfaces, and with a combination of parameter specification methods. To add hosts to an existing system, use the SAP HANA resident HDBLCM. For more information about installing a multiple-host system, see the Related Information.
The following graphic shows the file system for a multiple-host system installed on a shared file system with three hosts:
 
The server software is based on a flexible architecture that enables a distributed installation. This means that load can be balanced between different hosts. The server software has to be installed in a shared file system. This file system has to be mounted by all hosts that are part of the system.

Hardware and Software Requirements
For SAP HANA several hardware and software requirements need to be fulfilled.

You can find a complete list of all SAP HANA components and the respective SAP HANA hardware and software requirements in the Product Availability Matrix (PAM) on the SAP Service Marketplace

Software Requirements: Operating System for SAP HANA
For the SAP HANA system the following operating systems are available:
•	SUSE Linux Enterprise Server (SLES) 11 or higher
•	Red Hat Enterprise Linux (RHEL)
•	And IBM  POWER Systems
We will go with SUSE LINUX

Hardware Requirements:

For a new installation, you need to have at least 20 GB RAM in total just for the software - 15 GB for the basic software plus 5 GB for programs as well as some space for trace files. The additional memory required for data and log volumes varies according to your requirements.

During the update and the installation of the SAP HANA, a hardware check is performed in order to ensure that problems do not arise due to wrong or unsupported hardware configurations in combination with the SAP HANA platform.
The check is a script that is automatically called by the SAP HANA installer and aborts the installation process if it doesn't succeed.
It is not possible to disable the check because SAP HANA is highly optimized for specific hardware configurations which have been designed and tested together with our hardware partners. Outside of these validated configurations, SAP HANA performance and stability cannot be guaranteed.

Hardware Requirements for SAP HANA Network Connection
SAP recommends dedicated server network communication of 10 GB/s between the SAP HANA landscape and the source system for efficient data replication.

Important directories and their sizes:

The SAP HANA lifecycle management tool hdblcm requires certain file systems in order to successfully install an SAP HANA system.
The file systems can be defined manually before installation and then specified during installation, or the default file systems can be used. It is important that the file systems listed below are available and have the recommended disk space before starting the hdblcm program.

 
File System Structure for a Multi-SID Installation

 

Important notes:
•	An SAP HANA system in a production environment must not share any infrastructure with another SAP HANA system.
•	Hosts running more than one SAP HANA system (sometimes referred to as multiple-SID installations) can only be used for non-production purposes such as development, quality assurance, or testing. 

Summary:-
This document contains the installation steps of SAP HANA on Linux environment. I have gone through so many SCN links and documents to gather this information and created these documents.  The SAP HANA database Platform level is SPS09 or higher.
Pre-requites:-
1) Pre-study and go through the SAP Notes & recommendations
2) Prepare for Hardware requirements
3) Prepare for OS environment like UNIX, SUSE Linux, windows etc…
4) Install Java 1.6 or higher level
5) Install GUI Component
6) Download the HANA database software from service market place
SAP HANA server SPS09 (installation components)
•	SAP HANA Database
•	SAP HANA AFL
•	SAP HANA LCAPPS
•	SAP TRD AFL FOR HANA
•	SAP HANA Database Client
•	SAP HANA Studio
•	SAP HANA Smart Data Access 

Some other SAP HANA Components
1) Install SAP host Agent
2) Install HDB Studio Repository
3) Install Sum4Hana
4) Install-DB Studio HTTP Publisher
5) Install LM Structure
6) SAP HANA XS Engine

Caution!!!!
There are several types of licenses available for SAP HANA depending on the license type of your SAP HANA installation.
Introduction:-
SAP HANA is an in-memory platform for processing high volumes of data in real-time. HANA allows data analysts to query large volumes of data in real-time. HANA’s in-memory database infrastructure frees analysts from having to load or write-back data.
SAP HANA Architecture:-

 
Installation system definition type:-

●Single-host system – One SAP HANA instance on one host.
● Multiple-host (distributed) system – Multiple SAP HANA instances distributed over multiple hosts, with one instance per host.

Here we are going to install SAP HANA single host system

System Configuration             Database directories                          Local directory
Instance number: 00         |    Installation Path: /hana/shared             | hana2:/usr/sap/SID
SAP system ID: SID            |    Data Path: /hana/data/SID
SAP hostname : <hana2> |    Log Path: /hana/log/SID

There are two types of SAP HANA installation
1.	Use the Graphical User Interface to perform platform  LCM tasks.
2.	Use the Command-Line Interface to perform platform LCM tasks.
The below steps are explained how to do in GUI installation method
N.B . We need to first go to the Linux Server for our case it is (SUSE Linux SLES 12)
Steps to follow:-
1) Download the SAP HANA media file from  service market place
2) Place the media file into the some safe directory location
3) Log into OS level with” root user” or SIDadm
4) Go the directories which you the HANA media file cd <installation medium>/DATA_UNITS/HDB_LCM_LINUX_X86_64
5) Execute the command  ./hdblcm [for CLI]  or ./hdblcmgui [for GUI]  .
 
Note: For GUI installation to run you need use x-manager ,VNC Viewer or some there tool for Linux and UNIX.

There are five phases to perform during SAP HANA installation.
 

 

If you want add some more components then click the option “Add components Location” and select the directory the component files available.

Here we are cancelled and click “Next”

 
Select the option ” Install new system ” and click “Next”
 

Select the components option and click “Next”

 
Select the system type
•	Single -Host system or Multiple-Host system

Here we have selected Single host system and click ” Next”

 

Enter the hostname, SID, system no. Installation path,  database mode and system usage as per the requirement.
Allocated the memory usage here we have selected” Restart instance after machine reboot” and click “Next”

 
select the location of Data volume and Log Volume. Click ” Next”
For SPS12: Automatically assign XS Advanced Runtime roles to the hosts with database roles (y/n) [y]: y

 
Enter the Certificate host name “<server name> and Click ” Next”

 

Enter the <SID>adm password and click ” Next”
 

Enter the database user ”SYSTEM” password ******** and click ” Next”
Enter Customer Organization Name [orgname]: TEST12
Enter XS Advanced Admin User [XSA_ADMIN]: XSA_ADMIN
Enter XS Advanced Admin User Password:
Confirm XS Advanced Admin User Password:
Enter Customer Space Name [PROD]: PRD1
Select Next Button 
Select Routing Mode:

  Index | Routing Mode | Description
  --------------------------------------------------------------
  1     | ports        | Application URLs are based on ports
  2     | hostnames    | Application URLs are based on hostnames

Select Routing Mode / Enter Index [1]: 1
Enter XS Advanced Domain Name (see SAP Note 2245631) [newhana]: newhana
Run Applications in Customer Space with Separate OS User (y/n) [y]:Yes
Enter XS Advanced SAP Space OS User (sapwa1xsa) ID [1003]: 1003
Enter XS Advanced Customer Space OS User (wa1xsa) ID [1004]: 1004
And Press Next
Choose XS Advanced components to be installed or updated:

  Index | XS Advanced Components | Description
  ---------------------------------------------------------------------------------
  1     | all                    | All components
  2     | none                   | No components
  3     | xsac_sap_web_ide       | Install SAP Web Ide 1 version 3.012.0
  4     | xsac_di_core           | Install DI CORE 1 version 3.012.0
  5     | xsac_monitoring        | Install XS Monitoring 1 version 1.002.0
  6     | xsac_services          | Install XS Services 1 version 1.002.0
  7     | xsac_hrtt              | Install SAP HANA Runtime Tools 1 version 1.002.2

Enter comma-separated list of the selected indices [5,6]: Select All and Press Next


 
You can see the summary of parameters and software components of installation. you can revert back parameters if you want change by click” Previous”

If every-things look fine then Click ”Install”

 
 
You can able to see that SAP HANA installed successfully and you can view the log also.
Click” Finish”
The SAP HANA database installation completed successfully.
SAP HANA DB Installation Steps (Part 2)

Summary:-
This document contains the installation steps of SAP HANA SPS09 or higher using command-line method. The GUI method installation step are published in following Link http://scn.sap.com/docs/DOC-61037
Steps to follow:-
1) Download the SAP HANA media file from service market place
2) Place the media file into the some safe directory location
3) Log into OS level with” root user” or SIDadm
4) Go the directories which you the HANA media file cd <installation medium>/DATA_UNITS/HDB_SERVER_LINUX_X86_64
5) Start the SAP HANA platform lifecycle management tool:
6) Find the file and execute “./hdblcm –compontent_root=/DVD”

It will ask to choose the installation type

Choose system to update, or choose installation
Index | System |  Database  properties
———————————————————————–
1 | HDB(update)           | hostname
| |    
2 | Install New system  |
| |
3 | Exit(do nothing)       |
Enter selected system index [3]: 2
Here we have selected “2” to Install New system”
Select additional components for installation:

  Index | Components | Description
  -----------------------------------------------------------------------------------------------
  1     | server     | No additional components
  2     | all        | All components
  3     | client     | Install SAP HANA Database Client version 1.00.120.024.1461933179
  4     | afl        | Install SAP HANA AFL (incl.PAL,BFL,OFL,HIE) version 1.00.120.00.1462291682
  5     | smartda    | Install SAP HANA Smart Data Access version 1.00.6.001.0
  6     | studio     | Install SAP HANA Studio version 2.3.5.000000
  7     | trd        | Install SAP TRD AFL FOR HANA version 1.00.120.00.1462291682
  8     | xs         | Install SAP HANA XS Advanced Runtime version 1.0.24.268783
Enter comma-separated list of the selected indices [3, 7]:2 // Here we have selected  the option 2 to install the components and it will ask some parameters to enter
Enter Installation Path [/hana/shared]: /hana/shared
Enter Local Host Name [newhana]: newhana
Do you want to add additional hosts to the system? (y/n) [n]: n
Automatically assign XS Advanced Runtime roles to the hosts with database roles (y/n) [y]: y
Enter SAP HANA System ID : SID
Enter Instance Number [01] : <nr>
Index | Database Mode       | Description
———————————————-
1 | single_container     | The system contains
2 | multiple_containers | The system contains
Select Database Mode / Enter Index [1] : 1
Here we have select the option ‘1’. Based on your requirement you can select this option.
Index | System Usage    | Description
———————————————
1     | production      | System is used in a production environment
2     | test | System is used for testing, not production
3     | development     | System used for development, not production
4     | custom          | System usage is neither production, test or development
Select System Usage /Enter Index [4] : 4
Here we have select the option ‘4’. Based on your requirement you can select this option about the system type PRD or TEST or DEV or CUSTOM

Then enter the installation parameter to install SAP HANA like location directory, path etc…
Enter Location of Data Volumes [/hana/data/SID] : Path
Enter Location of Log Volume [/hana/log/SID] : path for directory to locate the log files
Restrict maximum memory allocation? [n] :
Enter Certificate Host Name For Host ‘hostname’ [hostname] : hostname
Enter System Administrator (SIDadm) Password : **************
confirm System Administrator (SIDadm) Password : ***************
Enter System Administrator Home Directory [/usr/sap/SID/home] : home directory to install
Enter System Administrator Login Shell [/bin/sh] :
Enter System Administrator User ID [username] : <user name>
Enter Database User (SYSTEM) password : ***************
confirm Database User (SYSTEM) Password : *******************
Restart instance after machine reboot? [n] : Y

Enter Customer Organization Name [orgname]: TEST12
Enter XS Advanced Admin User [XSA_ADMIN]: XSA_ADMIN
Enter XS Advanced Admin User Password:
Confirm XS Advanced Admin User Password:
Enter Customer Space Name [PROD]: PRD1

Select Routing Mode:

  Index | Routing Mode | Description
  --------------------------------------------------------------
  1     | ports        | Application URLs are based on ports
  2     | hostnames    | Application URLs are based on hostnames

Select Routing Mode / Enter Index [1]: 1
Enter XS Advanced Domain Name (see SAP Note 2245631) [newhana]: newhana
Run Applications in Customer Space with Separate OS User (y/n) [y]: y
Enter XS Advanced SAP Space OS User (sapwa1xsa) ID [1003]: 1003
Enter XS Advanced Customer Space OS User (wa1xsa) ID [1004]: 1004

Choose XS Advanced components to be installed or updated:

  Index | XS Advanced Components | Description
  ---------------------------------------------------------------------------------
  1     | all                    | All components
  2     | none                   | No components
  3     | xsac_sap_web_ide       | Install SAP Web Ide 1 version 3.012.0
  4     | xsac_di_core           | Install DI CORE 1 version 3.012.0
  5     | xsac_monitoring        | Install XS Monitoring 1 version 1.002.0
  6     | xsac_services          | Install XS Services 1 version 1.002.0
  7     | xsac_hrtt              | Install SAP HANA Runtime Tools 1 version 1.002.2

Enter comma-separated list of the selected indices [5,6]: 1
Once you given all the entry the it will show you the installation  parameters which have given and it will ask you to continue.
Do you want to continue? (y/n) :y
Installation completed successfully.
Users Created During Installation
The following users are automatically created during the installation: <sid>adm, sapadm, and SYSTEM.
User	Description
<sid>adm	The operating system administrator.
•	The user <sid>adm is the operating system user required for administrative tasks such as starting and stopping the system.
•	The user ID of the <sid>adm user is defined during the system installation. The user ID and group ID of this operating system user must be unique and identical on each host of a multiple-host system.
•	The password of the <sid>adm user is set during installation with the passwordparameter.
sapadm	The SAP Host Agent administrator.
•	If there is no SAP Host Agent available on the installation host, it is created during the installation along with the user sapadm.
•	If the SAP Host Agent is already available on the installation host, it is not modified by the installer. The sapadm user and password are also not modified.
•	The password of the sapadm user is set during installation with the sapadm_passwordparameter.
SYSTEM	The database superuser.
•	Initially, the SYSTEM user has all system permissions. Additional permissions can be granted and revoked again, however the initial permissions can never be revoked.
•	The password of the SYSTEM user is set during installation with thesystem_user_password  parameter.


Uninstall the SAP HANA System Using the Graphical User Interface
You can uninstall an SAP HANA system using the SAP HANA database lifecycle manager (HDBLCM) graphical user interface.
Prerequisites
•	You are logged in as root user.
•	Operating system users are set up for use with SAP HANA XS advanced. For information, see SAP Note 2243156 - Secure user setup for SAP HANA extended application services, advanced model.
•	The operating system administrator (<SID>adm) user may exist prior to installation. Make sure that you have the password of the existing <SID>adm user, and that the user attributes and group assignments are correct. The SAP HANA database lifecycle manager (HDBLCM) resident program will not modify the properties of any existing user or group.
Note: Using the SAP HANA database lifecycle manager, it is possible to remove the SAP HANA server, SAP HANA client, SAP HANA studio, HLM, Application Function Libraries (AFL and the product-specific AFLs POS, SAL, SCA, SOP, UDF), SAP liveCache applications (LCAPPS), or SAP HANA smart data access (SDA), but it is not possible to remove the SAP host agent or the Solution Manager Diagnostics (SMD) agent. If you need to uninstall the SMD agent, see SAP Note 1858920 in Related Information.
Context
Caution: Uninstalling the SAP HANA system removes all data volumes and log volumes. It is a permanent action that cannot be undone!
Procedure
1.	Change to the SAP HANA resident HDBLCM directory:
cd <sapmnt>/<SID>/hdblcm
By default, <sapmnt> is /hana/shared.
2.	Start the SAP HANA database lifecycle manager interactively in the graphical user interface:
./hdblcmgui | ./hdblcm
The SAP HANA database lifecycle manager graphical user interface appears.
3.	Select Uninstall SAP HANA Components from the activity options. Then select Next.
4.	Select Uninstall SAP HANA Database version <version number> and all other components. Then select Next.
5.	Review the summary, and select Uninstall to finalize the configuration.
Results
The selected components are uninstalled. A log file is available.

Operation via putty
newhana:~ # su - pocadm
newhana:/usr/sap/POC/HDB17> cd
newhana:~> cd /hana/shared/POC
newhana:/hana/shared/POC> ./hdblcm
-sh: ./hdblcm: is a directory
newhana:/hana/shared/POC> ls
exe     HDB17      hdblcm     hdbstudio_update  profile
global  hdbclient  hdbstudio  lm_structure
newhana:/hana/shared/POC> cd hdblcm
newhana:/hana/shared/POC/hdblcm> ls
adapters.d     filelist.resident  hdblcmgui  instruntime   resources
descriptors.d  hdblcm             hdblcmweb  operations.d  SIGNATURE.SMF
newhana:/hana/shared/POC/hdblcm> ./hdblcm

SAP HANA Lifecycle Management - SAP HANA 1.00.120.00.1462275491
***************************************************************


The following actions cannot be selected because the tool was not started as root user:
    - Update Component List
    - Rename the SAP HANA System
    - Update the SAP HANA Instance Host integration
    - Unregister the SAP HANA System

Choose an action to perform

  Index | Action to be performed     | Description
  --------------------------------------------------------------------------------------
  1     | add_host_roles             | Add Host Roles
  2     | add_hosts                  | Add Additional Hosts to the SAP HANA System
  3     | check_installation         | Check SAP HANA Installation
  4     | configure_internal_network | Configure Inter-Service Communication
  5     | configure_sld              | Configure System Landscape Directory Registration
  6     | convert_to_multidb         | Convert to Multitenant Database Containers
  7     | extract_components         | Extract Components
  8     | print_component_list       | Print Component List
  9     | remove_host_roles          | Remove Host Roles
  10    | uninstall                  | Uninstall SAP HANA Components
  11    | update_components          | Install or Update Additional Components
  12    | exit                       | Exit (do nothing)
Press  10 and enter
HANA system will be uninstalled but a log file will be generated for that particular SID 

N.B: to uninstall a particular Database one should access with corresponding <SID>adm

Multitenant Database Installation
1.We first login to the HANASERVER via putty as root 
User name: root
Password:***********
2. Then we use the command : 
locate hdblcmgui  (Though we are going to install the HANA SERVER via hdblcm but it easy to locate the installation path with hdblcmgui )
 

3.	Install a Multitenant Database Container System Using the Command-Line Interface(hdblcm)

                                                                Multitenant Database Containers

SAP HANA supports multiple isolated databases in a single SAP HANA system. These are referred to as multitenant database containers.
An SAP HANA system installed in multiple-container mode is capable of containing more than one multitenant database containers. Otherwise, it is a single-container system. Single-container systems can be converted to multiple-container systems.
A multiple-container system always has exactly one system database, used for central system administration, and any number of multitenant database containers (including zero), also called tenant databases. An SAP HANA system installed in multiple-container mode is identified by a single system ID (SID). Databases are identified by a SID and a database name. From the administration perspective, there is a distinction between tasks performed at system level and those performed at database level. Database clients, such as the SAP HANA studio, connect to specific databases.
All the databases in a multiple-container system share the same installation of database system software, the same computing resources, and the same system administration. However, each database is self-contained and fully isolated with its own:
•	Set of database users
•	Database catalog
•	Repository
•	Persistence
•	Backups
•	Traces and logs
Although database objects such as schemas, tables, views, procedures, and so on are local to the database, cross-database SELECT queries are possible. This supports cross-application reporting, for example.

Prerequisites : The installer needs to be a root user
Now we go to the defined installation path via the command:
: cd  /dev/shm/HANA_SOFT/HANA SP9/51049219/DATA_UNITS/HDB_LCM_LINUX_X86_64 /
The red demarked path is the installation medium

4.	Now we execute the command : ./hdblcm

a.	We select the 2nd option
 
b.	We select the 2nd option.(Note that we can install any component demarked in the List provided )  

c.	We select Multiple_container  i.e. :2nd option

   
d.	Then we select which option to choose amongst (PRD,TST,DEV,CUST),we choose custom i.e. neither TST,DEV,PRD
e.	Now we give some credentials like SID name, passwords, Administrative ID, paths for log, data and see the whole summary before carrying on with the installation(same as Single Container).
Following is the Summary before Installation:
 
5.	Now after we successfully installed the database we add the systems in the HANA studios
6.	 After that we need to add the tenant database
7.	We go to SQL editor and add the tenant database by the following SQL query
>    CREATE DATABASE DB1 SYSTEM USER PASSWORD Welcome1234;
           8.    We now add the system to the HANA Studios IDE.(Only thing is we need to select Tenant Database as the option when we are adding the system DB1).We give the credentials like SYSTEM user and corresponding Password
          9.  We complete the tenant system addition as well.
 

SAP HANA Multiple Container Database installed


