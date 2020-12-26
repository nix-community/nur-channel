# This file has been generated by node2nix 1.8.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {
    "@discoveryjs/json-ext-0.5.1" = {
      name = "_at_discoveryjs_slash_json-ext";
      packageName = "@discoveryjs/json-ext";
      version = "0.5.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@discoveryjs/json-ext/-/json-ext-0.5.1.tgz";
        sha512 = "Oee4NT60Lxe90m7VTYBU4UbABNaz0N4Q3G62CPB+6mGE4KuLMsTACmH8q3PH5u9pSZCuOdE9JClJ9vBqsp6DQg==";
      };
    };
    "@webpack-cli/info-1.2.0" = {
      name = "_at_webpack-cli_slash_info";
      packageName = "@webpack-cli/info";
      version = "1.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@webpack-cli/info/-/info-1.2.0.tgz";
        sha512 = "+wA8lBKopgKmN76BSGJVJby5ZXDlsrO6p/nm7fUBsHznRNWB/ozotJP7Yfcz8JPfqeG2LxwYlTH2u6D9a/0XAw==";
      };
    };
    "@webpack-cli/serve-1.2.0" = {
      name = "_at_webpack-cli_slash_serve";
      packageName = "@webpack-cli/serve";
      version = "1.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@webpack-cli/serve/-/serve-1.2.0.tgz";
        sha512 = "jI3P7jMp/AXDSPkM+ClwRcJZbxnlvNC8bVZBmyRr4scMMZ4p5WQcXkw3Q+Hc7RQekomJlBMN+UQGliT4hhG8Vw==";
      };
    };
    "ansi-colors-4.1.1" = {
      name = "ansi-colors";
      packageName = "ansi-colors";
      version = "4.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/ansi-colors/-/ansi-colors-4.1.1.tgz";
        sha512 = "JoX0apGbHaUJBNl6yF+p6JAFYZ666/hhCGKN5t9QFjbJQKUU/g8MNbFDbvfrgKXvI1QpZplPOnwIo99lX/AAmA==";
      };
    };
    "colorette-1.2.1" = {
      name = "colorette";
      packageName = "colorette";
      version = "1.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/colorette/-/colorette-1.2.1.tgz";
        sha512 = "puCDz0CzydiSYOrnXpz/PKd69zRrribezjtE9yd4zvytoRc8+RY/KJPvtPFKZS3E3wP6neGyMe0vOTlHO5L3Pw==";
      };
    };
    "commander-6.2.1" = {
      name = "commander";
      packageName = "commander";
      version = "6.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/commander/-/commander-6.2.1.tgz";
        sha512 = "U7VdrJFnJgo4xjrHpTzu0yrHPGImdsmD95ZlgYSEajAn2JKzDhDTPG9kBTefmObL2w/ngeZnilk+OV9CG3d7UA==";
      };
    };
    "cross-spawn-7.0.3" = {
      name = "cross-spawn";
      packageName = "cross-spawn";
      version = "7.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/cross-spawn/-/cross-spawn-7.0.3.tgz";
        sha512 = "iRDPJKUPVEND7dHPO8rkbOnPpyDygcDFtWjpeWNCgy8WP2rXcxXL8TskReQl6OrB2G7+UJrags1q15Fudc7G6w==";
      };
    };
    "end-of-stream-1.4.4" = {
      name = "end-of-stream";
      packageName = "end-of-stream";
      version = "1.4.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/end-of-stream/-/end-of-stream-1.4.4.tgz";
        sha512 = "+uw1inIHVPQoaVuHzRyXd21icM+cnt4CzD5rW+NC1wjOUSTOs+Te7FOv7AhN7vS9x/oIyhLP5PR1H+phQAHu5Q==";
      };
    };
    "enquirer-2.3.6" = {
      name = "enquirer";
      packageName = "enquirer";
      version = "2.3.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/enquirer/-/enquirer-2.3.6.tgz";
        sha512 = "yjNnPr315/FjS4zIsUxYguYUPP2e1NK4d7E7ZOLiyYCcbFBiTMyID+2wvm2w6+pZ/odMA7cRkjhsPbltwBOrLg==";
      };
    };
    "envinfo-7.7.3" = {
      name = "envinfo";
      packageName = "envinfo";
      version = "7.7.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/envinfo/-/envinfo-7.7.3.tgz";
        sha512 = "46+j5QxbPWza0PB1i15nZx0xQ4I/EfQxg9J8Had3b408SV63nEtor2e+oiY63amTo9KTuh2a3XLObNwduxYwwA==";
      };
    };
    "execa-4.1.0" = {
      name = "execa";
      packageName = "execa";
      version = "4.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/execa/-/execa-4.1.0.tgz";
        sha512 = "j5W0//W7f8UxAn8hXVnwG8tLwdiUy4FJLcSupCg6maBYZDpyBvTApK7KyuI4bKj8KOh1r2YH+6ucuYtJv1bTZA==";
      };
    };
    "fastest-levenshtein-1.0.12" = {
      name = "fastest-levenshtein";
      packageName = "fastest-levenshtein";
      version = "1.0.12";
      src = fetchurl {
        url = "https://registry.npmjs.org/fastest-levenshtein/-/fastest-levenshtein-1.0.12.tgz";
        sha512 = "On2N+BpYJ15xIC974QNVuYGMOlEVt4s0EOI3wwMqOmK1fdDY+FN/zltPV8vosq4ad4c/gJ1KHScUn/6AWIgiow==";
      };
    };
    "find-up-4.1.0" = {
      name = "find-up";
      packageName = "find-up";
      version = "4.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/find-up/-/find-up-4.1.0.tgz";
        sha512 = "PpOwAdQ/YlXQ2vj8a3h8IipDuYRi3wceVQQGYWxNINccq40Anw7BlsEXCMbt1Zt+OLA6Fq9suIpIWD0OsnISlw==";
      };
    };
    "function-bind-1.1.1" = {
      name = "function-bind";
      packageName = "function-bind";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/function-bind/-/function-bind-1.1.1.tgz";
        sha512 = "yIovAzMX49sF8Yl58fSCWJ5svSLuaibPxXQJFLmBObTuCr0Mf1KiPopGM9NiFjiYBCbfaa2Fh6breQ6ANVTI0A==";
      };
    };
    "get-stream-5.2.0" = {
      name = "get-stream";
      packageName = "get-stream";
      version = "5.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/get-stream/-/get-stream-5.2.0.tgz";
        sha512 = "nBF+F1rAZVCu/p7rjzgA+Yb4lfYXrpl7a6VmJrU8wF9I1CKvP/QwPNZHnOlwbTkY6dvtFIzFMSyQXbLoTQPRpA==";
      };
    };
    "has-1.0.3" = {
      name = "has";
      packageName = "has";
      version = "1.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/has/-/has-1.0.3.tgz";
        sha512 = "f2dvO0VU6Oej7RkWJGrehjbzMAjFp5/VKPp5tTpWIV4JHHZK1/BxbFRtf/siA2SWTe09caDmVtYYzWEIbBS4zw==";
      };
    };
    "human-signals-1.1.1" = {
      name = "human-signals";
      packageName = "human-signals";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/human-signals/-/human-signals-1.1.1.tgz";
        sha512 = "SEQu7vl8KjNL2eoGBLF3+wAjpsNfA9XMlXAYj/3EdaNfAlxKthD1xjEQfGOUhllCGGJVNY34bRr6lPINhNjyZw==";
      };
    };
    "import-local-3.0.2" = {
      name = "import-local";
      packageName = "import-local";
      version = "3.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/import-local/-/import-local-3.0.2.tgz";
        sha512 = "vjL3+w0oulAVZ0hBHnxa/Nm5TAurf9YLQJDhqRZyqb+VKGOB6LU8t9H1Nr5CIo16vh9XfJTOoHwU0B71S557gA==";
      };
    };
    "interpret-2.2.0" = {
      name = "interpret";
      packageName = "interpret";
      version = "2.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/interpret/-/interpret-2.2.0.tgz";
        sha512 = "Ju0Bz/cEia55xDwUWEa8+olFpCiQoypjnQySseKtmjNrnps3P+xfpUmGr90T7yjlVJmOtybRvPXhKMbHr+fWnw==";
      };
    };
    "is-core-module-2.2.0" = {
      name = "is-core-module";
      packageName = "is-core-module";
      version = "2.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-core-module/-/is-core-module-2.2.0.tgz";
        sha512 = "XRAfAdyyY5F5cOXn7hYQDqh2Xmii+DEfIcQGxK/uNwMHhIkPWO0g8msXcbzLe+MpGoR951MlqM/2iIlU4vKDdQ==";
      };
    };
    "is-stream-2.0.0" = {
      name = "is-stream";
      packageName = "is-stream";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-stream/-/is-stream-2.0.0.tgz";
        sha512 = "XCoy+WlUr7d1+Z8GgSuXmpuUFC9fOhRXglJMx+dwLKTkL44Cjd4W1Z5P+BQZpr+cR93aGP4S/s7Ftw6Nd/kiEw==";
      };
    };
    "isexe-2.0.0" = {
      name = "isexe";
      packageName = "isexe";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz";
        sha1 = "e8fbf374dc556ff8947a10dcb0572d633f2cfa10";
      };
    };
    "locate-path-5.0.0" = {
      name = "locate-path";
      packageName = "locate-path";
      version = "5.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/locate-path/-/locate-path-5.0.0.tgz";
        sha512 = "t7hw9pI+WvuwNJXwk5zVHpyhIqzg2qTlklJOf0mVxGSbe3Fp2VieZcduNYjaLDoy6p9uGpQEGWG87WpMKlNq8g==";
      };
    };
    "lodash-4.17.20" = {
      name = "lodash";
      packageName = "lodash";
      version = "4.17.20";
      src = fetchurl {
        url = "https://registry.npmjs.org/lodash/-/lodash-4.17.20.tgz";
        sha512 = "PlhdFcillOINfeV7Ni6oF1TAEayyZBoZ8bcshTHqOYJYlrqzRK5hagpagky5o4HfCzzd1TRkXPMFq6cKk9rGmA==";
      };
    };
    "merge-stream-2.0.0" = {
      name = "merge-stream";
      packageName = "merge-stream";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/merge-stream/-/merge-stream-2.0.0.tgz";
        sha512 = "abv/qOcuPfk3URPfDzmZU1LKmuw8kT+0nIHvKrKgFrwifol/doWcdA4ZqsWQ8ENrFKkd67Mfpo/LovbIUsbt3w==";
      };
    };
    "mimic-fn-2.1.0" = {
      name = "mimic-fn";
      packageName = "mimic-fn";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/mimic-fn/-/mimic-fn-2.1.0.tgz";
        sha512 = "OqbOk5oEQeAZ8WXWydlu9HJjz9WVdEIvamMCcXmuqUYjTknH/sqsWvhQ3vgwKFRR1HpjvNBKQ37nbJgYzGqGcg==";
      };
    };
    "npm-run-path-4.0.1" = {
      name = "npm-run-path";
      packageName = "npm-run-path";
      version = "4.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/npm-run-path/-/npm-run-path-4.0.1.tgz";
        sha512 = "S48WzZW777zhNIrn7gxOlISNAqi9ZC/uQFnRdbeIHhZhCA6UqpkOT8T1G7BvfdgP4Er8gF4sUbaS0i7QvIfCWw==";
      };
    };
    "once-1.4.0" = {
      name = "once";
      packageName = "once";
      version = "1.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/once/-/once-1.4.0.tgz";
        sha1 = "583b1aa775961d4b113ac17d9c50baef9dd76bd1";
      };
    };
    "onetime-5.1.2" = {
      name = "onetime";
      packageName = "onetime";
      version = "5.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/onetime/-/onetime-5.1.2.tgz";
        sha512 = "kbpaSSGJTWdAY5KPVeMOKXSrPtr8C8C7wodJbcsd51jRnmD+GZu8Y0VoU6Dm5Z4vWr0Ig/1NKuWRKf7j5aaYSg==";
      };
    };
    "p-limit-2.3.0" = {
      name = "p-limit";
      packageName = "p-limit";
      version = "2.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/p-limit/-/p-limit-2.3.0.tgz";
        sha512 = "//88mFWSJx8lxCzwdAABTJL2MyWB12+eIY7MDL2SqLmAkeKU9qxRvWuSyTjm3FUmpBEMuFfckAIqEaVGUDxb6w==";
      };
    };
    "p-locate-4.1.0" = {
      name = "p-locate";
      packageName = "p-locate";
      version = "4.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/p-locate/-/p-locate-4.1.0.tgz";
        sha512 = "R79ZZ/0wAxKGu3oYMlz8jy/kbhsNrS7SKZ7PxEHBgJ5+F2mtFW2fK2cOtBh1cHYkQsbzFV7I+EoRKe6Yt0oK7A==";
      };
    };
    "p-try-2.2.0" = {
      name = "p-try";
      packageName = "p-try";
      version = "2.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/p-try/-/p-try-2.2.0.tgz";
        sha512 = "R4nPAVTAU0B9D35/Gk3uJf/7XYbQcyohSKdvAxIRSNghFl4e71hVoGnBNQz9cWaXxO2I10KTC+3jMdvvoKw6dQ==";
      };
    };
    "path-exists-4.0.0" = {
      name = "path-exists";
      packageName = "path-exists";
      version = "4.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/path-exists/-/path-exists-4.0.0.tgz";
        sha512 = "ak9Qy5Q7jYb2Wwcey5Fpvg2KoAc/ZIhLSLOSBmRmygPsGwkVVt0fZa0qrtMz+m6tJTAHfZQ8FnmB4MG4LWy7/w==";
      };
    };
    "path-key-3.1.1" = {
      name = "path-key";
      packageName = "path-key";
      version = "3.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/path-key/-/path-key-3.1.1.tgz";
        sha512 = "ojmeN0qd+y0jszEtoY48r0Peq5dwMEkIlCOu6Q5f41lfkswXuKtYrhgoTpLnyIcHm24Uhqx+5Tqm2InSwLhE6Q==";
      };
    };
    "path-parse-1.0.6" = {
      name = "path-parse";
      packageName = "path-parse";
      version = "1.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/path-parse/-/path-parse-1.0.6.tgz";
        sha512 = "GSmOT2EbHrINBf9SR7CDELwlJ8AENk3Qn7OikK4nFYAu3Ote2+JYNVvkpAEQm3/TLNEJFD/xZJjzyxg3KBWOzw==";
      };
    };
    "pkg-dir-4.2.0" = {
      name = "pkg-dir";
      packageName = "pkg-dir";
      version = "4.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/pkg-dir/-/pkg-dir-4.2.0.tgz";
        sha512 = "HRDzbaKjC+AOWVXxAU/x54COGeIv9eb+6CkDSQoNTt4XyWoIJvuPsXizxu/Fr23EiekbtZwmh1IcIG/l/a10GQ==";
      };
    };
    "pump-3.0.0" = {
      name = "pump";
      packageName = "pump";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/pump/-/pump-3.0.0.tgz";
        sha512 = "LwZy+p3SFs1Pytd/jYct4wpv49HiYCqd9Rlc5ZVdk0V+8Yzv6jR5Blk3TRmPL1ft69TxP0IMZGJ+WPFU2BFhww==";
      };
    };
    "rechoir-0.7.0" = {
      name = "rechoir";
      packageName = "rechoir";
      version = "0.7.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/rechoir/-/rechoir-0.7.0.tgz";
        sha512 = "ADsDEH2bvbjltXEP+hTIAmeFekTFK0V2BTxMkok6qILyAJEXV0AFfoWcAq4yfll5VdIMd/RVXq0lR+wQi5ZU3Q==";
      };
    };
    "resolve-1.19.0" = {
      name = "resolve";
      packageName = "resolve";
      version = "1.19.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/resolve/-/resolve-1.19.0.tgz";
        sha512 = "rArEXAgsBG4UgRGcynxWIWKFvh/XZCcS8UJdHhwy91zwAvCZIbcs+vAbflgBnNjYMs/i/i+/Ux6IZhML1yPvxg==";
      };
    };
    "resolve-cwd-3.0.0" = {
      name = "resolve-cwd";
      packageName = "resolve-cwd";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/resolve-cwd/-/resolve-cwd-3.0.0.tgz";
        sha512 = "OrZaX2Mb+rJCpH/6CpSqt9xFVpN++x01XnN2ie9g6P5/3xelLAkXWVADpdz1IHD/KFfEXyE6V0U01OQ3UO2rEg==";
      };
    };
    "resolve-from-5.0.0" = {
      name = "resolve-from";
      packageName = "resolve-from";
      version = "5.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/resolve-from/-/resolve-from-5.0.0.tgz";
        sha512 = "qYg9KP24dD5qka9J47d0aVky0N+b4fTU89LN9iDnjB5waksiC49rvMB0PrUJQGoTmH50XPiqOvAjDfaijGxYZw==";
      };
    };
    "shebang-command-2.0.0" = {
      name = "shebang-command";
      packageName = "shebang-command";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/shebang-command/-/shebang-command-2.0.0.tgz";
        sha512 = "kHxr2zZpYtdmrN1qDjrrX/Z1rR1kG8Dx+gkpK1G4eXmvXswmcE1hTWBWYUzlraYw1/yZp6YuDY77YtvbN0dmDA==";
      };
    };
    "shebang-regex-3.0.0" = {
      name = "shebang-regex";
      packageName = "shebang-regex";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/shebang-regex/-/shebang-regex-3.0.0.tgz";
        sha512 = "7++dFhtcx3353uBaq8DDR4NuxBetBzC7ZQOhmTQInHEd6bSrXdiEyzCvG07Z44UYdLShWUyXt5M/yhz8ekcb1A==";
      };
    };
    "signal-exit-3.0.3" = {
      name = "signal-exit";
      packageName = "signal-exit";
      version = "3.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/signal-exit/-/signal-exit-3.0.3.tgz";
        sha512 = "VUJ49FC8U1OxwZLxIbTTrDvLnf/6TDgxZcK8wxR8zs13xpx7xbG60ndBlhNrFi2EMuFRoeDoJO7wthSLq42EjA==";
      };
    };
    "strip-final-newline-2.0.0" = {
      name = "strip-final-newline";
      packageName = "strip-final-newline";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/strip-final-newline/-/strip-final-newline-2.0.0.tgz";
        sha512 = "BrpvfNAE3dcvq7ll3xVumzjKjZQ5tI1sEUIKr3Uoks0XUl45St3FlatVqef9prk4jRDzhW6WZg+3bk93y6pLjA==";
      };
    };
    "v8-compile-cache-2.2.0" = {
      name = "v8-compile-cache";
      packageName = "v8-compile-cache";
      version = "2.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/v8-compile-cache/-/v8-compile-cache-2.2.0.tgz";
        sha512 = "gTpR5XQNKFwOd4clxfnhaqvfqMpqEwr4tOtCyz4MtYZX2JYhfr1JvBFKdS+7K/9rfpZR3VLX+YWBbKoxCgS43Q==";
      };
    };
    "webpack-merge-4.2.2" = {
      name = "webpack-merge";
      packageName = "webpack-merge";
      version = "4.2.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/webpack-merge/-/webpack-merge-4.2.2.tgz";
        sha512 = "TUE1UGoTX2Cd42j3krGYqObZbOD+xF7u28WB7tfUordytSjbWTIjK/8V0amkBfTYN4/pB/GIDlJZZ657BGG19g==";
      };
    };
    "which-2.0.2" = {
      name = "which";
      packageName = "which";
      version = "2.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/which/-/which-2.0.2.tgz";
        sha512 = "BLI3Tl1TW3Pvl70l3yq3Y64i+awpwXqsGBYWkkqMtnbXgrMD+yj7rhW0kuEDxzJaYXGjEW5ogapKNMEKNMjibA==";
      };
    };
    "wrappy-1.0.2" = {
      name = "wrappy";
      packageName = "wrappy";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz";
        sha1 = "b5243d8f3ec1aa35f1364605bc0d1036e30ab69f";
      };
    };
  };
  args = {
    name = "webpack-cli";
    packageName = "webpack-cli";
    version = "4.3.0";
    src = fetchurl { url = "https://registry.npmjs.org/webpack-cli/-/webpack-cli-4.3.0.tgz"; sha1 = "e39303bf9f8002de122903e97029f3443d0f9174"; };
    dependencies = [
      sources."@discoveryjs/json-ext-0.5.1"
      sources."@webpack-cli/info-1.2.0"
      sources."@webpack-cli/serve-1.2.0"
      sources."ansi-colors-4.1.1"
      sources."colorette-1.2.1"
      sources."commander-6.2.1"
      sources."cross-spawn-7.0.3"
      sources."end-of-stream-1.4.4"
      sources."enquirer-2.3.6"
      sources."envinfo-7.7.3"
      sources."execa-4.1.0"
      sources."fastest-levenshtein-1.0.12"
      sources."find-up-4.1.0"
      sources."function-bind-1.1.1"
      sources."get-stream-5.2.0"
      sources."has-1.0.3"
      sources."human-signals-1.1.1"
      sources."import-local-3.0.2"
      sources."interpret-2.2.0"
      sources."is-core-module-2.2.0"
      sources."is-stream-2.0.0"
      sources."isexe-2.0.0"
      sources."locate-path-5.0.0"
      sources."lodash-4.17.20"
      sources."merge-stream-2.0.0"
      sources."mimic-fn-2.1.0"
      sources."npm-run-path-4.0.1"
      sources."once-1.4.0"
      sources."onetime-5.1.2"
      sources."p-limit-2.3.0"
      sources."p-locate-4.1.0"
      sources."p-try-2.2.0"
      sources."path-exists-4.0.0"
      sources."path-key-3.1.1"
      sources."path-parse-1.0.6"
      sources."pkg-dir-4.2.0"
      sources."pump-3.0.0"
      sources."rechoir-0.7.0"
      sources."resolve-1.19.0"
      sources."resolve-cwd-3.0.0"
      sources."resolve-from-5.0.0"
      sources."shebang-command-2.0.0"
      sources."shebang-regex-3.0.0"
      sources."signal-exit-3.0.3"
      sources."strip-final-newline-2.0.0"
      sources."v8-compile-cache-2.2.0"
      sources."webpack-merge-4.2.2"
      sources."which-2.0.2"
      sources."wrappy-1.0.2"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "CLI for webpack & friends";
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
in
{
  args = args;
  sources = sources;
  tarball = nodeEnv.buildNodeSourceDist args;
  package = nodeEnv.buildNodePackage args;
  shell = nodeEnv.buildNodeShell args;
}