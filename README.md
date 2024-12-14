# W11_SetupScript
Windows 11 setup script. Can be configured to continuously apply the desired configuration if let's say some other policies would overwrite it.

## Configuration
If no custom configuration is provided the install/uninstall scripts will use the default one.

### .config.json
You can copy .config.example.json as .config.json.

To configure the program to run only scripts you choose edit the "EnabledScripts" JSON array.

To configure repeated reapplying of the setup and delay between the repetitions edit the "Enabled" and "Delay" variables of "Loop" JSON key.

The "Delay" variable is amount of time to wait in seconds before reapplying the Windows setup. Recommended value is 10 seconds.

**The smaller the value you choose the more impact the script will have on CPU usage.**

### .install.json
If you want to customize the installation path of the scheduled task you can copy .install.example.json as .install.json and then run the [installation process](#Installation)

The "File" JSON key contains name and path to the folder of the scheduled task .xml file. I recommend to not edit those keys.

The "Task" JSON key contains name and path under which the task should be imported to the task scheduler. You can edit those keys to your liking.

## Installation
Run INSTALL.cmd as admin.

## Uninstallation
Run UNINSTALL.cmd as admin.

## Moving the repository to diffrent location
If you want to move this repository to diffrent folder on your filesystem after installation. **Firstly uninstall the program.** Move the repository and then install the program back.
