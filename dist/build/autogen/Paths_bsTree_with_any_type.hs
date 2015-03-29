module Paths_bsTree_with_any_type (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/anastasia/Haskell/bsTree-with-any-type/.cabal-sandbox/bin"
libdir     = "/home/anastasia/Haskell/bsTree-with-any-type/.cabal-sandbox/lib/x86_64-linux-ghc-7.8.3/bsTree-with-any-type-0.1.0.0"
datadir    = "/home/anastasia/Haskell/bsTree-with-any-type/.cabal-sandbox/share/x86_64-linux-ghc-7.8.3/bsTree-with-any-type-0.1.0.0"
libexecdir = "/home/anastasia/Haskell/bsTree-with-any-type/.cabal-sandbox/libexec"
sysconfdir = "/home/anastasia/Haskell/bsTree-with-any-type/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "bsTree_with_any_type_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "bsTree_with_any_type_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "bsTree_with_any_type_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "bsTree_with_any_type_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "bsTree_with_any_type_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
