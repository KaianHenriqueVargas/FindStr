unit fmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.ExtCtrls, JvBaseDlg, JvSelectDirectory;

type
  TfmBuscaStrings = class(TForm)
    Panel2: TPanel;
    edPalavraBuscar: TLabeledEdit;
    edBuscaDiretorio: TSearchBox;
    Button1: TButton;
    listArquivos: TListBox;
    Label1: TLabel;
    OpenDialog: TJvSelectDirectory;
    procedure Button1Click(Sender: TObject);
    procedure edBuscaDiretorioInvokeSearch(Sender: TObject);
  private
    procedure BuscarArquivosComString(const Diretorio, TextoParaBuscar: string);
    function Validar(Diretorio, Palavra: string): Boolean;
  public
    { Public declarations }
  end;

var
  fmBuscaStrings: TfmBuscaStrings;

implementation

uses
  System.Types;

{$R *.dfm}

procedure TfmBuscaStrings.BuscarArquivosComString(const Diretorio, TextoParaBuscar: string);
var
  SR: TSearchRec;
  Arquivo: string;
  Conteudo: TStringList;
begin

  // Busca por arquivos no diretório
  if FindFirst(Diretorio + '\*.*', faAnyFile, SR) = 0 then
  begin
    repeat
      // Ignora diretórios "." e ".."
      if (SR.Attr and faDirectory) = faDirectory then
        Continue;

      Arquivo := Diretorio + '\' + SR.Name;
      Conteudo := TStringList.Create;
      try
        // Lê o conteúdo do arquivo
        Conteudo.LoadFromFile(Arquivo);

        // Verifica se o conteúdo contém o texto buscado
        if Pos(TextoParaBuscar, Conteudo.Text) > 0 then
          listArquivos.Items.Add(Arquivo);
      except
        on E: Exception do
          Writeln(Format('Erro ao ler o arquivo %s: %s', [Arquivo, E.Message]));
      end;
      Conteudo.Free;
    until FindNext(SR) <> 0;

    FindClose(SR);
  end;

  // Verifica também subdiretórios recursivamente
  if FindFirst(Diretorio + '\*.*', faDirectory, SR) = 0 then
  begin
    repeat
      if (SR.Attr and faDirectory) = faDirectory then
      begin
        // Ignora os diretórios "." e ".."
        if (SR.Name <> '.') and (SR.Name <> '..') then
        begin

          listArquivos.Items.Add(Arquivo);
          BuscarArquivosComString(Diretorio + '\' + SR.Name, TextoParaBuscar);
        end;
      end;
    until FindNext(SR) <> 0;

    FindClose(SR);
  end;
end;

procedure TfmBuscaStrings.Button1Click(Sender: TObject);
begin
  if Validar(edBuscaDiretorio.Text, edPalavraBuscar.Text) then
  begin
    listArquivos.Clear;
    BuscarArquivosComString(edBuscaDiretorio.Text, edPalavraBuscar.Text);
  end;
end;

procedure TfmBuscaStrings.edBuscaDiretorioInvokeSearch(Sender: TObject);
begin
  if OpenDialog.Execute() then
    edBuscaDiretorio.Text := OpenDialog.Directory;
end;

function TfmBuscaStrings.Validar(Diretorio, Palavra: string): Boolean;
begin
  Result := False;
  if (Trim(Palavra) = EmptyStr) then
  begin
    ShowMessage('Palavra para busca não preenchida');
    exit;
  end;

  if (Trim(Diretorio) = EmptyStr) then
  begin
    ShowMessage('Diretorio contendo arquivos para busca não preenchido');
    exit;
  end;

  if (not DirectoryExists(Diretorio)) then
  begin
    ShowMessage('Diretorio inserido não existe');
    exit;
  end;
  Result := True;
end;

end.

