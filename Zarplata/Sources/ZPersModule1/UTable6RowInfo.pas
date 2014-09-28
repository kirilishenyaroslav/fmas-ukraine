unit UTable6RowInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxMaskEdit, cxDropDownEdit, cxCalc, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxCheckBox, cxSpinEdit, cxButtonEdit, PackageLoad, zTypes,
  IBASE, cxLabel;

type
  TfrmTable6Row = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    col10: TcxCalcEdit;
    Label3: TLabel;
    Label4: TLabel;
    col11: TcxCalcEdit;
    col12: TcxCalcEdit;
    Label5: TLabel;
    col13: TcxCheckBox;
    col14: TcxCheckBox;
    Col8: TcxSpinEdit;
    Col9: TcxSpinEdit;
    col6_7: TcxButtonEdit;
    MENUM_CD_DEKRET: TcxMaskEdit;
    cxLabel1: TcxLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure col6_7PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    FDBHandle:TISC_DB_HANDLE;
  public
    { Public declarations }
    FIdman:Int64;
    constructor Create(AOwner:TComponent;Dbhandle:TISC_DB_HANDLE); reintroduce;
  end;



implementation

{$R *.dfm}

procedure TfrmTable6Row.cxButton1Click(Sender: TObject);
begin
     if (col6_7.Text<>'') and (MENUM_CD_DEKRET.Text<>'')
     then ModalResult:=mrYes
     else ShowMessage('Не вибрана фізична особа');
end;

procedure TfrmTable6Row.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmTable6Row.col6_7PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Man:Variant;
begin
     Man:=LoadPeopleModal(Self,FDBHandle);
     if VarArrayDimCount(Man)> 0
     then begin
               If Man[0]<>NULL
               then begin
                         FIdman:=Man[0];
                         col6_7.Text := VarToStr(Man[1])+' '+VarToStr(Man[2])+' '+VarToStr(Man[3]);
               end;
      end;
end;

constructor TfrmTable6Row.Create(AOwner: TComponent; Dbhandle: TISC_DB_HANDLE);
begin
     inherited Create(AOwner);
     FDBHandle:=Dbhandle;
end;

end.
