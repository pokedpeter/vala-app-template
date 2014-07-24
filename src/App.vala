namespace Template {

public class App : Granite.Application {

    View.AppWindow _app_win;

	construct {
        program_name = "Project";
    }

    public override void activate() {
        // Logging
        Granite.Services.Logger.DisplayLevel = Granite.Services.LogLevel.DEBUG;
        Granite.Services.Logger.initialize (this.program_name);

        _app_win = new View.AppWindow (this);
        _app_win.show_all ();
    }

    public static int main (string[] args) {
        Gtk.init (ref args);
        var app = new App ();
        return app.run (args);
    }
}

}