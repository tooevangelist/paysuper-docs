# PaySuper Docs
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache2.0-green.svg)](https://opensource.org/licenses/Apache2.0)
[![Build Status](https://travis-ci.org/paysuper/paysuper-docs.svg?branch=master)](https://travis-ci.org/paysuper/paysuper-docs) 

This is a fork of [Slate](https://github.com/lord/slate) customised for the PaySuper API documentation. This repository 
use the Docker with Slate as application.   

## Developing the doc

When writing the markdown documentation we would want to edit our markdown and then live preview the result. The `source` folder
in current directory is a source directory for api docs:

```
docker-compose up 
```

Then, the preview of the published html can be viewed at [127.0.0.1:4567](http://127.0.0.1:4567)
