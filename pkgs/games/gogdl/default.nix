{ lib
, buildPythonApplication
, fetchFromGitHub
, pythonOlder
, setuptools
, requests
}:

buildPythonApplication rec {
  pname = "gogdl";
  version = "0.3";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "Heroic-Games-Launcher";
    repo = "heroic-gogdl";
    rev = "v${version}";
    sha256 = "sha256-lVNvmdUK7rjSNVdhDuSxyfuEw2FeZt0rVf9pdtsfgqE=";
  };

  disabled = pythonOlder "3.8";

  propagatedBuildInputs = [
    setuptools
    requests
  ];

  pythonImportsCheck = [ "gogdl" ];

  meta = with lib; {
    description = "GOG Downloading module for Heroic Games Launcher";
    homepage = "https://github.com/Heroic-Games-Launcher/heroic-gogdl";
    license = with licenses; [ gpl3 ];
    maintainers = with maintainers; [ aidalgol ];
  };
}
