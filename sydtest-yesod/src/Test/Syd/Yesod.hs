{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-redundant-constraints #-}

module Test.Syd.Yesod
  ( -- * Functions to run a test suite
    yesodSpec,
    yesodSpecWithSiteGenerator,
    yesodSpecWithSiteGeneratorAndArgument,
    yesodSpecWithSiteSupplier,
    yesodSpecWithSiteSupplierWith,

    -- ** Core
    YesodSpec,
    YesodClient (..),
    YesodClientM (..),
    runYesodClientM,
    YesodExample,

    -- ** Helper functions in case you want to do something fancy
    yesodSpecWithFunc,

    -- * Helper functions to define tests
    yit,
    ydescribe,

    -- * Making requests
    get,
    post,
    performMethod,
    performRequest,

    -- ** Using the request builder
    request,
    setUrl,
    setMethod,
    addRequestHeader,
    addGetParam,
    addPostParam,
    addFile,
    addFileWith,
    setRequestBody,

    -- *** Types
    RequestBuilder (..),
    runRequestBuilder,

    -- *** Token
    addToken,
    addToken_,
    addTokenFromCookie,
    addTokenFromCookieNamedToHeaderNamed,

    -- *** Queries
    getLocation,

    -- * Declaring assertions
    statusIs,

    -- ** Reexports
    module HTTP,
  )
where

import Network.HTTP.Client as HTTP
import Network.HTTP.Types as HTTP
import Test.Syd.Yesod.Client
import Test.Syd.Yesod.Def
import Test.Syd.Yesod.Request
