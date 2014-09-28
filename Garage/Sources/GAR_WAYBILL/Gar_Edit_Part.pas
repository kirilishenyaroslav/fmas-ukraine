unit Gar_Edit_Part;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxMaskEdit, cxButtonEdit, StdCtrls,
  cxButtons, ExtCtrls, cxContainer, cxEdit, cxTextEdit, cxControls,
  cxGroupBox, gar_Types, gar_LoadPackageGarage, gar_GarageProc, gar_Consts,
  ActnList;

type
  TFEditPart = class(TForm)
    cxGroupBox11: TcxGroupBox;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    GroupBoxProp: TcxGroupBox;
    EditBtn: TcxButtonEdit;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    cxTextEdit10: TcxMaskEdit;
    procedure EditBtnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Action1Execute(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
  private
    ParamLoc:TgarParamWaybillPart;
    constructor Create(Param:TgarParamWaybillPart);reintroduce;
    { Private declarations }
  public
    { Public declarations }
  end;

function view_edit_part(param:TgarParamWaybillPart):boolean;
var
  FEditPart: TFEditPart;

implementation

{$R *.dfm}

function view_edit_part(param:TgarParamWaybillPart):boolean;
begin
  FEditPart:=TFEditPart.create(param);
  Case  Param.fs  of
          garfsInsert:
            begin
              FEditPart.cxTextEdit10.Text:=param.MILAGE;
            end;
          garfsUpdate:
            begin
              FEditPart.EditBtn.text:=param.name_factor;
              FEditPart.cxTextEdit10.Text:=param.MILAGE;
            end
          //arfsDelete:
        end;
  if FEditPart.ShowModal=mrYes
    then Result:=True
  else Result:=False;
end;

constructor TFEditPart.Create(Param: TgarParamWaybillPart);
begin
  inherited create(Param.Owner);
  ParamLoc:=Param;
end;

procedure TFEditPart.EditBtnPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var factor:variant;
param:TgarSimpleParamMode;
Sname:string;
begin
  param:=TgarSimpleParamMode.Create;
  param.DB_Handle:=ParamLoc.DB_Handle;
  Param.Owner:=self;
  Param.fs:=garfsSelect;
  factor:=LoadPackageGarage(Param, Name_Gar_Sp_Factor);
  if VarArrayDimCount(factor)>0 then
   begin
      if factor[0]<>NULL then
      begin
        try
          //RxMemoryData1.FieldByName('ID_FACTOR').AsInteger:=factor[0];
          ParamLoc.id_factor:=factor[0];
          ParamLoc.name_factor:=factor[1];
          EditBtn.Text:=factor[1];
          //Sname := VarToStrDef(factor[1],'');
          //RxMemoryData1.FieldByName('VALUE_FACTOR').AsFloat:=Double(factor[2]);

          {case ParamLoc.fs of
            garfsUpdate:
            begin
             DM.pFIBStoredProc1.Transaction.StartTransaction;
             DM.pFIBStoredProc1.StoredProcName:='GAR_WAYBILL_FACTOR_I';
             DM.pFIBStoredProc1.Prepare;
             DM.pFIBStoredProc1.ParamByName('ID_WAYBILL').AsInt64 :=ParamLoc.ID_Waybill;
             DM.pFIBStoredProc1.ParamByName('ID_FACTOR').AsInt64  :=factor[0];
             DM.pFIBStoredProc1.ExecProc;
             RxMemoryData1.FieldByName('ID_WayBill_FACTOR').AsInteger:=DM.pFIBStoredProc1.ParamByName('ID_WayBill_FACTOR').AsInt64 ;
            end
          end;

          RxMemoryData1.Post;}
        except
            on e:Exception do
              begin
                garShowMessage(ECaption[LanguageIndex],e.message,mtError,[mbOk]);
              end;
        end;
      end;
   end;

end;

procedure TFEditPart.Action1Execute(Sender: TObject);
begin
  if cxTextEdit10.Text='' then
    begin
      showmessage('Поле "Пробег" пусто!');
      exit;
    end;
  ParamLoc.MILAGE:=cxTextEdit10.EditValue;
  ModalResult:=mrYes;
end;

procedure TFEditPart.cxButton2Click(Sender: TObject);
begin
  ModalResult:=mrCANCEL;
end;

procedure TFEditPart.Action2Execute(Sender: TObject);
begin
  if  cxButton1.Focused Then Action1Execute(Sender);
      if  cxButton2.Focused Then cxButton2Click(Sender);
      SendKeyDown(Self.ActiveControl,VK_TAB,[]);
end;

end.
