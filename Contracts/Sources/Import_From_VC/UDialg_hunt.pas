unit UDialg_hunt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, FileCtrl, StdCtrls, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxButtons,
  ComCtrls, TabNotBk, dblookup, Buttons, cxClasses, cxStyles,
  cxGridTableView;

type
  TFmDialog = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    SelectBut: TcxButton;
    Closebut: TcxButton;
    DriveComboBox1: TDriveComboBox;
    FilterComboBox1: TFilterComboBox;
    DirectoryListBox1: TDirectoryListBox;
    FileNameStr: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    FileListBox1: TFileListBox;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    procedure ClosebutClick(Sender: TObject);
    procedure SelectButClick(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    ResultArray : Variant;
  end;
     function UPathAll(AOwner:TComponent):Variant;stdcall;
     exports UPathAll;
var
  FmDialog: TFmDialog;

implementation

{$R *.dfm}

function UPathAll(AOwner:TComponent):Variant;
var
 form : TFmDialog;
begin
      form := TFmDialog.Create(AOwner);
      form.ShowModal;
      UPathAll := form.ResultArray;
      form.Free;
end;


procedure TFmDialog.ClosebutClick(Sender: TObject);
begin
    close;
end;

procedure TFmDialog.SelectButClick(Sender: TObject);
{var
    strlook : string;
    looking : integer; }
begin
   { if (FileNameStr.Text <> '*.rar') and (FileNameStr.Text <> '') then
    begin
        looking := Length(FileNameStr.Text);
        strlook := FileNameStr.Text;
        if strlook[looking] <> '\' then
        begin}
            ResultArray := VarArrayCreate([0,1], varVariant);
            ResultArray[0] := Label1.Caption + '\'+ FileNameStr.Text;
            ResultArray[1] := FileNameStr.Text;
            close;
        {end else
        begin
            ResultArray := VarArrayCreate([0,1], varVariant);
            ResultArray[0] := Label1.Caption + FileNameStr.Text;
            ResultArray[1] := FileNameStr.Text;
            close;
        end;
    end else
    begin
        showMessage('Задайте корректное имя файла!');
    end; }
end;

procedure TFmDialog.DirectoryListBox1Change(Sender: TObject);
begin
    FileNameStr.Text := Label1.Caption;
end;

procedure TFmDialog.FormCreate(Sender: TObject);
begin
     FileNameStr.Text := Label1.Caption;
end;

procedure TFmDialog.SpeedButton1Click(Sender: TObject);
begin
    FileNameStr.Text := 'A:\';
end;

end.
