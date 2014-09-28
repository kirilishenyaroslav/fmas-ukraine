unit UGetAnalizeLevel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxRadioGroup, cxControls, cxContainer, cxEdit, cxCheckBox, cxTextEdit,
  cxMaskEdit, cxButtonEdit, Ibase, DB, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, cxPropertiesStore;

type
  TfrmGetAnalizelevel = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    GroupBox1: TGroupBox;
    Criteria1: TcxCheckBox;
    Criteria2: TcxCheckBox;
    Criteria3: TcxCheckBox;
    Criteria4: TcxCheckBox;
    cxRadioGroup1: TcxRadioGroup;
    RazdStValue: TcxButtonEdit;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    GetInfoDataSet: TpFIBDataSet;
    cxPropertiesStore1: TcxPropertiesStore;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure RazdStValueChange(Sender: TObject);
  private
    { Private declarations }
    LDbHandle:TISC_DB_HANDLE;
  public
    id_razd_st:Int64;
    { Public declarations }
    constructor Create(AOwner:TComponent;DbHandle:TISC_DB_HANDLE);reintroduce;
  end;


implementation

uses GlobalSpr;

{$R *.dfm}
constructor TfrmGetAnalizelevel.Create(AOwner:TComponent;DbHandle:TISC_DB_HANDLE);
begin
     inherited Create(AOwner);
     LDbHandle:=DbHandle;

end;

procedure TfrmGetAnalizelevel.RazdStValueChange(Sender: TObject);
begin
     RazdStValue.Enabled:=Criteria4.Checked;
end;


procedure TfrmGetAnalizelevel.cxButtonEdit1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var Res:Variant;

begin
     Res:=GetRazdStSpr(self,
                       LDbHandle,
                       fsNormal,
                       Date,
                       -1,
                       allEnable,
                       cmRazd);
     if (Res<>NULL)
     then begin
               //Поднимаем инфомацию по разделу
               WorkDatabase.Handle:=LDbHandle;
               ReadTransaction.StartTransaction;
               GetInfoDataSet.SelectSQL.Text:='SELECT * FROM PUB_SPR_RAZD_ST WHERE ID_RAZD_ST='+VarToStr(Res);
               GetInfoDataSet.Open;
               if (GetInfoDataSet.RecordCount>0)
               then begin
                         RazdStValue.Text:=GetInfoDataSet.FieldByName('RAZD_ST_TITLE').AsString;
               end;
               GetInfoDataSet.Close;
               GetInfoDataSet.Free;
               id_razd_st:=res;
     end
end;

procedure TfrmGetAnalizelevel.cxButton1Click(Sender: TObject);
begin
      ModalResult:=mrYes;
end;

procedure TfrmGetAnalizelevel.cxButton2Click(Sender: TObject);
begin
      ModalResult:=mrNo;
end;

end.
