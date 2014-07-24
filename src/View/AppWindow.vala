namespace Template.View {

public class AppWindow : Gtk.Window {
	
	public AppWindow (Granite.Application app) {

        set_application (app);
		set_title (app.program_name);
        set_default_size (500, 300);
        window_position = Gtk.WindowPosition.CENTER;		
	
        setup ();
	}

	public void setup () {
	}

}

}