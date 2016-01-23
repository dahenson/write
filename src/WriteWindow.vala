namespace Write {
    const int MIN_WIDTH = 600;
    const int MIN_HEIGHT = 400;

    class WriteWindow : Gtk.Window {
        public static Granite.Application app { get; private set; }

        private WriteView text;
        private Gtk.HeaderBar header;

        public WriteWindow (WriteApp app) {

            const string ELEMENTARY_STYLESHEET =  """
                .write-window {
                    background-color: #fff;
                }

                .write-text {
                    color: #444444;
                    -GtkWidget-cursor-color: shade(@selected_bg_color, 1.2);
                    -GtkWidget-cursor-aspect-ratio: 0.1;
                    -GtkTextView-view-border-top-color: #000;
                    margin-top: 24px;
                }

                .write-text:selected {
                    color: #fff;
                }
            """;

            Granite.Widgets.Utils.set_theming_for_screen (this.get_screen (), ELEMENTARY_STYLESHEET,
                                               Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);

            header = new Gtk.HeaderBar();
            header.set_show_close_button(true);
            header.get_style_context ().add_class ("compact");
            header.set_title ("Write");

            this.app = app;
            this.set_titlebar(header);
            this.set_default_size (MIN_WIDTH, MIN_HEIGHT);
            this.get_style_context ().add_class ("write-window");

            text = new WriteView ();
            text.expand = true;
            text.set_size_request (MIN_WIDTH, MIN_HEIGHT);

            this.add (text);
            this.show_all ();
        }
    }
}
