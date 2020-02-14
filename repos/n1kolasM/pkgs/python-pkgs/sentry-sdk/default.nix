{ aiohttp
, bottle
, buildPythonPackage
, celery
, certifi
, django
, falcon
, fetchPypi
, flask
, iana-etc
, isPy3k
, libredirect
, pyramid
, rq
, sanic
, sqlalchemy
, stdenv
, tornado
, urllib3
}:

buildPythonPackage rec {
  pname = "sentry-sdk";
  version = "0.14.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "16s7i5wy665iap24z6gx5niqay2ic10rkfp2w5l3ibdyrw3xl8z0";
  };

  doCheck = false;
  checkInputs = [ django flask tornado bottle rq falcon sqlalchemy ]
  ++ stdenv.lib.optionals isPy3k [ celery pyramid sanic aiohttp ];

  propagatedBuildInputs = [ urllib3 certifi ];

  meta = with stdenv.lib; {
    homepage = "https://github.com/getsentry/sentry-python";
    description = "New Python SDK for Sentry.io";
    license = licenses.bsd2;
    maintainers = with maintainers; [ gebner ];
  };

  # The Sentry tests need access to `/etc/protocols` (the tests call
  # `socket.getprotobyname('tcp')`, which reads from this file). Normally
  # this path isn't available in the sandbox. Therefore, use libredirect
  # to make on eavailable from `iana-etc`. This is a test-only operation.
  preCheck = ''
    export NIX_REDIRECTS=/etc/protocols=${iana-etc}/etc/protocols
    export LD_PRELOAD=${libredirect}/lib/libredirect.so
  '';
  postCheck = "unset NIX_REDIRECTS LD_PRELOAD";
}

