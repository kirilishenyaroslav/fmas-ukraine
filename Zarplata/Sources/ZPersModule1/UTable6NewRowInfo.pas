unit UTable6NewRowInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxCheckBox, cxMaskEdit, cxDropDownEdit, cxCalc, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxSpinEdit, cxCalendar, cxButtonEdit,
  PackageLoad, zTypes,
  IBASE, cxDBEdit, DBCtrls, cxLabel;

type
  TfrmTable6RowNew = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    col12: TcxCalcEdit;
    Label3: TLabel;
    Label4: TLabel;
    col13: TcxCalcEdit;
    col14: TcxCalcEdit;
    Label5: TLabel;
    col15: TcxCheckBox;
    col16: TcxCheckBox;
    Label6: TLabel;
    col10: TcxDateEdit;
    Label7: TLabel;
    col11: TcxSpinEdit;
    col8: TcxSpinEdit;
    col9: TcxSpinEdit;
    col6_7: TcxButtonEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label8: TLabel;
    cxSpinEdit1: TcxSpinEdit;
    Label9: TLabel;
    cxSpinEdit2: TcxSpinEdit;
    cxCheckBoxOZN_NEW_WORK_PL: TcxCheckBox;
    Label10: TLabel;
    cxSpinEdit3: TcxSpinEdit;
    cxLabel1: TcxLabel;
    MENUM_CD_DEKRET: TcxMaskEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure col6_7PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    FDbHandle:TISC_DB_HANDLE;
  public
    { Public declarations }
    FIdMan:Int64;
    constructor Create(AOwner:TComponent;DbHandle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

{$R *.dfm}

procedure TfrmTable6RowNew.cxButton1Click(Sender: TObject);
begin
     if (col6_7.Text<>'')
     then ModalResult:=mrYes
     else ShowMessage('Не вибрана фізична особа');
end;

procedure TfrmTable6RowNew.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmTable6RowNew.col6_7PropertiesButtonClick(Sender: TObject;
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

constructor TfrmTable6RowNew.Create(AOwner: TComponent; DbHandle: TISC_DB_HANDLE);
begin
     inherited Create(AOwner);
     FDbHandle:=DbHandle;
end;

end.
