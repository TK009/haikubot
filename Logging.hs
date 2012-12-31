------------------------------------------------------------------------------
-- File:          Logging.hs
-- Creation Date: Dec 31 2012 [00:12:31]
-- Last Modified: Dec 31 2012 [07:00:06]
-- Created By: Samuli Thomasson [SimSaladin] samuli.thomassonAtpaivola.fi
------------------------------------------------------------------------------
--
-- | Haikubot logging
module Logging 
  ( logInfo
  , logInfo'
  , logErr
  , logOut
  ) where

import            Data.Text       (Text)
import            Data.Monoid     (mappend)
import qualified  Data.Text       as T
import qualified  Data.Text.IO    as T
import            Internal.Types

logInfo' :: Show s => s -> Handler ()
logInfo' = liftIO . print

-- | Log a message 
logInfo :: Text -> Handler ()
logInfo = liftIO . T.putStrLn . ("[log] " `mappend`)

-- | Log an error.
logErr :: Text -> Handler ()
logErr = liftIO . T.putStrLn . ("[warn] " `mappend`)

logOut :: Text -> Handler ()
logOut = liftIO . T.putStrLn . ("[out] " `mappend`)

-- logRes :: Result -> Handler ()
-- logRes (ResFailure msg) = raise $ encodeUtf8 msg
-- logRes (ResSuccess msg) = log $ encodeUtf8 msg
-- logRes ResNone          = raise "No handler found"

