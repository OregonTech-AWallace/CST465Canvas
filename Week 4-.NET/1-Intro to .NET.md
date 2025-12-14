# Intro to .NET
I'm going to assume that all of you have had some exposure to the C# 
language and .NET environment at this point.  You may hear of these terms when others talk of .NET, so you should be able to understand the distinction

## .NET Framework
The .NET framework is the original release of .NET and was heavily Windows-centric.  There were projects which sought to make the code portable to Linux (see Mono), but Microsoft only officially supported it on Windows.

## .NET Core
Microsoft recognized that he C# language had become very popular and the ease of building applications with .NET was so desirable that even entities outside of Microsoft were trying to build compatible runtimes for Linux/Mac.  .NET Core was created to fill the community desire for an open source and platform-independent .NET.  All current development is on this version.  As of .NET Core 5, the "Core" was dropped from the name and it is now what is referred to by the term ".NET".

**.NET CORE WAS A FULL REWRITE OF MOST PARTS OF .NET**

## .NET Standard
This was a specification released by Microsoft which included a few of their main libraries.  Code written for .NET Standard was assured to compile and run without modification on both .NET Framework and .NET Core.  It was a transitional technology in order to help organizations with the switch between Framework and Core and is now considered obsolete

##  Long live .NET!
For the rest of this course, unless I explicitly name .NET Framework or Standard, you can assume I mean .NET Core when I say ".NET".
