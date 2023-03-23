{ util, deriveElixirs }:

let releases = util.findByPrefix ./. (baseNameOf ./.);
in deriveElixirs releases "22" "24"
