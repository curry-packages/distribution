--------------------------------------------------------------------------------
--- This module contains definition of constants to obtain information
--- concerning the current distribution of the Curry implementation, e.g.,
--- compiler version, run-time version, installation directory.
---
--- @author Michael Hanus
--- @version December 2018
--------------------------------------------------------------------------------

module Language.Curry.Distribution
  ( curryCompiler, curryCompilerMajorVersion, curryCompilerMinorVersion
  , curryCompilerRevisionVersion
  , curryRuntime, curryRuntimeMajorVersion, curryRuntimeMinorVersion
  , baseVersion, installDir, rcFileName
  ) where

import System.Directory ( getHomeDirectory )
import System.FilePath  ( FilePath, (</>) )

-----------------------------------------------------------------
-- Compiler and run-time environment name and version
-----------------------------------------------------------------

--- The name of the Curry compiler (e.g., "pakcs" or "kics2").
curryCompiler :: String
curryCompiler external

--- The major version number of the Curry compiler.
curryCompilerMajorVersion :: Int
curryCompilerMajorVersion external

--- The minor version number of the Curry compiler.
curryCompilerMinorVersion :: Int
curryCompilerMinorVersion external

--- The revision version number of the Curry compiler.
curryCompilerRevisionVersion :: Int
curryCompilerRevisionVersion external

--- The name of the run-time environment (e.g., "sicstus", "swi", or "ghc")
curryRuntime :: String
curryRuntime external

--- The major version number of the Curry run-time environment.
curryRuntimeMajorVersion :: Int
curryRuntimeMajorVersion external

--- The minor version number of the Curry run-time environment.
curryRuntimeMinorVersion :: Int
curryRuntimeMinorVersion external

--- The version number of the base libraries (e.g., "1.0.5").
baseVersion :: String
baseVersion external

--- Path of the main installation directory of the Curry compiler.
installDir :: FilePath
installDir external

--- The name of the file specifying configuration parameters of the
--- current distribution.
--- This file must have the usual format of property files.
rcFileName :: IO String
rcFileName = getHomeDirectory >>= return . (</> rcFile)
  where rcFile = '.' : curryCompiler ++ "rc"

-----------------------------------------------------------
