namespace Write {

    class WriteView : Gtk.Grid {
        private Gtk.ScrolledWindow scroll;
        private Gtk.Grid left_box;
        private Gtk.Grid right_box;
        private Gtk.SourceView text;
        private Gtk.TextBuffer buf;

        public WriteView () {
            text = new Gtk.SourceView ();
            text.set_size_request (MIN_WIDTH, MIN_HEIGHT);
            text.wrap_mode = Gtk.WrapMode.WORD;
            text.set_left_margin (24);
            text.set_right_margin (24);
            text.get_style_context ().add_class ("write-text");
            text.expand = false;

            scroll = new Gtk.ScrolledWindow (null, null);
            scroll.add (text);
            scroll.set_policy (Gtk.PolicyType.NEVER, Gtk.PolicyType.AUTOMATIC);

            left_box = new Gtk.Grid ();
            left_box.expand = true;

            right_box = new Gtk.Grid ();
            right_box.expand = true;

            this.attach (left_box, 0, 0, 1, 1);
            this.attach (scroll, 1, 0, 1, 1);
            this.attach (right_box, 2, 0, 1, 1);

            var font = Pango.FontDescription.from_string ("Droid Sans Mono 12");
            text.override_font (font);

            buf = text.get_buffer ();
            buf.set_text ("Hello!", -1);
        }
    }
}
