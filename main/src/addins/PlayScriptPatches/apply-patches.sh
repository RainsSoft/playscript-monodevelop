echo "Applying patch files PlayScriptBinding.patch and ICSharpCode.NRefactory.PlayScript.patch to CSharp projects..."

# ------------  PlayScriptBinding --------------

rm ../CSharpBinding/.DS_Store
rm -rf ../CSharpBinding/obj
rm -rf ../CSharpBinding/Makefile
rm -rf ../CSharpBinding/AspNet/obj
rm -rf ../CSharpBinding/AspNet/Makefile
rm -rf ../CSharpBinding/Autotools/obj
rm -rf ../CSharpBinding/Autotools/Makefile

# Copy language binding files for PlayScript
cp ../CSharpBinding/MonoDevelop.CSharp/CSharpLanguageBinding.cs ../CSharpBinding/MonoDevelop.CSharp/ActionScriptLanguageBinding.cs
cp ../CSharpBinding/MonoDevelop.CSharp/CSharpLanguageBinding.cs ../CSharpBinding/MonoDevelop.CSharp/PlayScriptLanguageBinding.cs

# Make the new PlayScriptBinding folder
mv ../PlayScriptBinding ../PlayScriptBinding_save
cp -R ../CSharpBinding ../PlayScriptBinding/

# Apply patch
patch < PlayScriptBinding.patch

# Restore project and plugin names
mv ../PlayScriptBinding/CSharpBinding.csproj ../PlayScriptBinding/PlayScriptBinding.csproj
mv ../PlayScriptBinding/CSharpBinding.addin.xml ../PlayScriptBinding/PlayScriptBinding.addin.xml

# Remove language binding files for PlayScript
rm ../CSharpBinding/MonoDevelop.CSharp/ActionScriptLanguageBinding.cs
rm ../CSharpBinding/MonoDevelop.CSharp/PlayScriptLanguageBinding.cs

# ------------  NRefactory --------------

mv ../ICSharpCode.NRefactory.PlayScript ../ICSharpCode.NRefactory.PlayScript_save
cp -R ../../../external/nrefactory/ICSharpCode.NRefactory.CSharp ../ICSharpCode.NRefactory.PlayScript/

# Make patch of NRefactory.CSharp
patch < ICSharpCode.NRefactory.PlayScript.patch

# Restore project names
mv ../ICSharpCode.NRefactory.PlayScript/ICSharpCode.NRefactory.CSharp.csproj ../ICSharpCode.NRefactory.PlayScript/ICSharpCode.NRefactory.PlayScript.csproj

echo "Done applying patch files."

