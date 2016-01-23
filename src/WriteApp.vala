using Gtk;
using Granite;

namespace Write {

    class WriteApp : Granite.Application {
    
        WriteWindow window = null;

        construct {

            program_name = "Write";
            exec_name = "write";

            app_years = "2014";
            application_id = "net.launchpad.agenda";
            app_icon = "application-default-icon";
            app_launcher = "write.desktop";

            main_url = "https://code.launchpad.net/write";
            bug_url = "https://bugs.launchpad.net/write";
            help_url = "https://code.launchpad.net/write";
            translate_url = "https://translations.launchpad.net/write";
        
            about_authors = {"Dane Henson <dane.henson@gmail.com>"};
            about_documenters = {"Dane Henson <dane.henson@gmail.com"};
            about_artists = {""};
            about_comments = "Development release, things might break.";
            about_translators = "";
            about_license_type = Gtk.License.GPL_3_0;
        }

        protected override void activate () {
                        
            if (window != null) {
                window.present (); // present window if app is already open
                return;
            }
            
            window = new WriteWindow (this);
            window.set_application (this);
            window.set_position (Gtk.WindowPosition.CENTER);
        }

    	public static int main (string[] args) {
	        
	        var app = new WriteApp ();
	        
	        if (args[1] == "-s") {
		        return 0;
	        }
	        
	        return app.run (args);
        }

    }

}
