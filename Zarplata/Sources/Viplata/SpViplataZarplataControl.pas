unit SpViplataZarplataControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, cxLabel,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxControls, cxGroupBox,
  Unit_SpViplat_Consts, ActnList, cxButtonEdit, LoadDogManedger,DogLoaderUnit, Ibase,
  GlobalSpr, pFibDataBase;

type
  TFormZSpr_Viplata_Control = class(TForm)
    IdentificationBox: TcxGroupBox;
    MaskEditShortName: TcxMaskEdit;
    MaskEditFullName: TcxMaskEdit;
    LabelFullName: TcxLabel;
    LabelShortName: TcxLabel;
    Bevel1: TBevel;
    ActionList1: TActionList;
    Action1: TAction;
    cxLabel1: TcxLabel;
    cxButtonEdit1: TcxButtonEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MaskEditShortNameKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEditFullNameKeyPress(Sender: TObject; var Key: Char);
    procedure Action1Execute(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    FDb_handle:TISC_DB_HANDLE;
    FRT:TpFibTransaction;
  public
    id_rate_account:Int64;
    { Public declarations }
    constructor Create(AOwner:TComponent;db_handle:TISC_DB_Handle;RT:TpFibTransaction);reintroduce;
  end;

implementation

{$R *.dfm}

procedure TFormZSpr_Viplata_Control.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFormZSpr_Viplata_Control.FormCreate(Sender: TObject);
begin
self.IdentificationBox.Caption := FormZSp_Viplata_Control_IdentificationBox_Caption;
self.LabelShortName.Caption    := FormZSp_Viplata_Control_LabelShortName_Caption;
self.LabelFullName.Caption     := FormZSp_Viplata_Control_LabelFullName_Caption;
self.YesBtn.Caption            := YesBtn_Caption;
self.CancelBtn.Caption         := CancelBtn_Caption;
end;

procedure TFormZSpr_Viplata_Control.MaskEditShortNameKeyPress(
  Sender: TObject; var Key: Char);
begin
If (Length(MaskEditShortName.Text)=15) and (Key<>#7) and (key<>#8) then key:=#0;
end;

procedure TFormZSpr_Viplata_Control.MaskEditFullNameKeyPress(
  Sender: TObject; var Key: Char);
begin
If (Length(MaskEditFullName.Text)=60) and (Key<>#7) and (key<>#8) then key:=#0;
end;

procedure TFormZSpr_Viplata_Control.Action1Execute(Sender: TObject);
begin
if MaskEditShortName.Text='' then
   MaskEditShortName.SetFocus
else
 if MaskEditFullName.Text='' then
    MaskEditFullName.SetFocus
 else
  ModalResult:=mrYes;
end;

procedure TFormZSpr_Viplata_Control.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  i, o : TSpravParams;
begin
      i := TSpravParams.Create;
      o := TSpravParams.Create;
      i['DataBase'] := Integer(FDb_Handle);
      i['FormStyle'] := fsNormal;
      i['bMultiSelect'] := false;
      i['id_session'] := -1;
      i['SelectMode'] := selRateAccount;
      i['id_cistomer'] := -1;
      i['show_all'] := 1;
      LoadSysData(FRT);
      DogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);

      if o['ModalResult'] = mrOk
      then begin
                id_rate_account := o['ID_RATE_ACCOUNT'];
                cxButtonEdit1.Text:=VarToStr(o['NAME_BANK'])+'(לפמ '+VarToStr(o['MFO'])+') נ:'+VarToStr(o['RATE_ACCOUNT']);

      end;
end;

constructor TFormZSpr_Viplata_Control.Create(AOwner: TComponent;
  db_handle: TISC_DB_Handle; RT:TpFibTransaction);
begin
     inherited Create(AOwner);
     FDb_handle:=Db_handle;
     FRT:=RT;
end;

end.

