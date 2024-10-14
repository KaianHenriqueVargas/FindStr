program FindStrInFiles;

uses
  Vcl.Forms,
  fmPrincipal in 'fmPrincipal.pas' {fmBuscaStrings};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmBuscaStrings, fmBuscaStrings);
  Application.Run;
end.
