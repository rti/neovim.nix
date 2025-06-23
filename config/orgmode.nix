{ ... }:

{
  plugins.orgmode = {
    enable = true;
    settings = {
      org_agenda_files = "~/orgmode/**/*";
      org_default_notes_file = "~/orgmode/refile.org";
    };
  };
}

