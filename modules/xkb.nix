{ pkgs, ... }:

let
  ruLatSymbols = pkgs.writeText "ru-lat" ''
    default partial alphanumeric_keys
    xkb_symbols "ru-lat" {
      include "us(basic)"

      name[Group1] = "Russian (Latin transliteration)";

      // Physical positions follow the standard Russian ЙЦУКЕН layout:
      // ё й ц у к е н г ш щ з х ъ  ->  ë j c u k e n g š ŝ z x ʺ
      //   ф ы в а п р о л д ж э  ->    f y v a p r o l d ž è
      //    я ч с м и т ь б ю  ->     â č s m i t ʹ b û
      // Shift selects uppercase forms where Unicode defines a case pair.
      key <TLDE> { [ U00EB, U00CB ] };

      key <AD01> { [ j, J ] };
      key <AD02> { [ c, C ] };
      key <AD03> { [ u, U ] };
      key <AD04> { [ k, K ] };
      key <AD05> { [ e, E ] };
      key <AD06> { [ n, N ] };
      key <AD07> { [ g, G ] };
      key <AD08> { [ U0161, U0160 ] };
      key <AD09> { [ U015D, U015C ] };
      key <AD10> { [ z, Z ] };
      key <AD11> { [ x, X ] };
      key <AD12> { [ U02BA, U02BA ] };

      key <AC01> { [ f, F ] };
      key <AC02> { [ y, Y ] };
      key <AC03> { [ v, V ] };
      key <AC04> { [ a, A ] };
      key <AC05> { [ p, P ] };
      key <AC06> { [ r, R ] };
      key <AC07> { [ o, O ] };
      key <AC08> { [ l, L ] };
      key <AC09> { [ d, D ] };
      key <AC10> { [ U017E, U017D ] };
      key <AC11> { [ U00E8, U00C8 ] };

      key <AB01> { [ U00E2, U00C2 ] };
      key <AB02> { [ U010D, U010C ] };
      key <AB03> { [ s, S ] };
      key <AB04> { [ m, M ] };
      key <AB05> { [ i, I ] };
      key <AB06> { [ t, T ] };
      key <AB07> { [ U02B9, U02B9 ] };
      key <AB08> { [ b, B ] };
      key <AB09> { [ U00FB, U00DB ] };
    };
  '';
in
{
  services.xserver.xkb.extraLayouts."ru-lat" = {
    description = "Russian written with one-character Latin transliteration";
    languages = [ "rus" ];
    symbolsFile = ruLatSymbols;
  };
}
