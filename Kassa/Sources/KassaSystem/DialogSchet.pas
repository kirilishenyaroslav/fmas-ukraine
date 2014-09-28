{************************************************************************
* Unit KassaSystemMain.					                *
*							                *
* Описание предназначения(работы) модуля: справочник касс и счетов      *
* Copyright ©  Год 2006, Автор: Ворновских Макс                         *
*************************************************************************}

unit DialogSchet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, FIBDatabase, pFIBDatabase, cxControls,
  cxContainer, cxEdit, cxCheckBox, ExtCtrls, StdCtrls, cxButtons,KassaSystemMain,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxLabel, FIBQuery, pFIBQuery,
  pFIBStoredProc, DB, FIBDataSet, pFIBDataSet;

type
  TfmDialogSchet = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Panel1: TPanel;
    cxCheckBoxSchDef: TcxCheckBox;
    pFIBDatabase1: TpFIBDatabase;
    cxLabelID_Sch: TcxLabel;
    cxButtonEditID_Sch: TcxButtonEdit;
    pFIBStoredProc: TpFIBStoredProc;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBDataSetForChek: TpFIBDataSet;
    constructor Create (AOwner: TComponent; Mode:String; var MainForm : TfmKassaSystemMain;  DB: TpFIBDatabase; id_use:int64); reintroduce;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEditID_SchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    function IsSchetUsed(id_sch_in: int64): boolean;//tue, если данный счёт уже использовался в какой-то системе
  private
        Local_Mode: String;
        m : TfmKassaSystemMain;
  public
    { Public declarations }
    id_user: int64;
    id_sch : int64;  // идентификатор возвращаемого счёта
  end;

var
  fmDialogSchet: TfmDialogSchet;

implementation
Uses  Un_R_file_Alex ,GlobalSPR, LoadDogManedger, DogLoaderUnit;
{$R *.dfm}

function TfmDialogSchet.IsSchetUsed(id_sch_in: int64): boolean;  //tue, если данный счёт уже использовался в какой-то системе
begin
        pFIBDataSetForChek.Database     := pFIBDatabase1;
        pFIBDataSetForChek.Transaction  := pFIBTransactionRead;
        pFIBDataSetForChek.SQLs.SelectSQL.Text := 'Select * from KASSA_SYSTEM_IS_SCHET_USED('+inttostr(id_sch_in)+')';
        pFIBDataSetForChek.Open;
        if (pFIBDataSetForChek.FBN('FLAG').AsInteger = 0) then
                result := true
        else
                result := false;
        pFIBDataSetForChek.Close;

end;
constructor TfmDialogSchet.Create(AOwner: TComponent; Mode:String; var MainForm : TfmKassaSystemMain;  DB: TpFIBDatabase; id_use:int64);
begin
        inherited Create (AOwner);
        id_user := id_use;
        pFIBDatabase1.DefaultTransaction        := pFIBTransactionRead;
        //pFIBTransactionRead.StartTransaction;
        pFIBDatabase1                           := DB;
        pFIBTransactionRead.DefaultDatabase     := pFIBDatabase1;
        pFIBStoredProc.Database                 := pFIBDatabase1;
        pFIBStoredProc.Transaction              := pFIBTransactionWrite;
        pFIBTransactionWrite.DefaultDatabase    := pFIBDatabase1;

        Local_Mode := Mode;
        m := MainForm;
        if m.pFIBDataSetSchet.FBN('ID_SCH').AsString<>'' then
                id_sch  := StrToInt64(m.pFIBDataSetSchet.FBN('ID_SCH').AsString);
        if Local_Mode = 'Insert' then
        begin
        {Визуальная часть}
                self.Caption                    := Un_R_file_Alex.KASSA_DIALOG_SCHET_FM_CAPTION_ADD;
                cxLabelID_Sch.Caption           := Un_R_file_Alex.KASSA_DIALOG_SCHET_LABEL;
                cxButton1.Caption               := Un_R_file_Alex.KASSA_MY_BUTTON_ADD1;

        {......SUPER FUNCTION.....}
        if (m.IsThereAnySchetDefault)then
                cxCheckBoxSchDef.Enabled := false
        else
                cxCheckBoxSchDef.Enabled := true;
        end;
        if   (not (m.IsThereAnySchetDefault)) and (m.pFIBDataSetSchet.RecordCount = 0) then
        begin
                cxCheckBoxSchDef.Checked := true;
                cxCheckBoxSchDef.Enabled := false;
        end;
        {.........................}

        if Local_Mode = 'Update' then
        begin
        {Визуальная часть}
                self.Caption                    := Un_R_file_Alex.KASSA_DIALOG_SCHET_FM_CAPTION_UP;
                cxLabelID_Sch.Caption           := Un_R_file_Alex.KASSA_DIALOG_SCHET_LABEL;
                cxButton1.Caption               := Un_R_file_Alex.KASSA_MY_BUTTON_UPDATE1;
                {SUPER}
                if m.pFIBDataSetSchet.FBN('FLAG_DEFAULT').AsString = '1' then
                begin
                        cxCheckBoxSchDef.Checked := true
                end
                else
                begin
                        cxCheckBoxSchDef.Checked := false;
                end;

                {.....}
                cxButtonEditID_Sch.EditValue := Variant(m.pFIBDataSetSchet.FBN('SCH_NUM').AsString+' - '+m.pFIBDataSetSchet.FBN('SCH_TITLE').AsString);  //забирается TITLE счёта из ГРИДА

                {Очень нужна проверка!}
                if (m.IsThereAnySchetDefault) and (m.pFIBDataSetSchet.FBN('FLAG_DEFAULT').AsString = '0')then
                        cxCheckBoxSchDef.Enabled := false;
                if (m.IsThereAnySchetDefault) and (m.pFIBDataSetSchet.FBN('FLAG_DEFAULT').AsString = '1')then
                        cxCheckBoxSchDef.Enabled := true;
                

        end;
        cxButton2.Caption               := Un_R_file_Alex.MY_BUTTON_CLOSE1;
end;

procedure TfmDialogSchet.cxButton2Click(Sender: TObject);
begin
        if pFIBTransactionRead.Active then
                pFIBTransactionRead.Rollback;
        Close; 
end;

procedure TfmDialogSchet.cxButtonEditID_SchPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
        res : Variant;
begin
  Res := GlobalSPR.GetSch(self, pFIBDatabase1.Handle, fsNormal, Date, 1, 0, 0);
    if VarArrAyDimCount(res) > 0
    then
    begin
        if VarArrayDimCount(Res) > 0 then
        begin
            id_sch     := Res[0][0];  {записать в базу}
            cxButtonEditID_Sch.Text := Res[0][3] + ' - ' + Res[0][1];
        end;
    end;

end;

procedure TfmDialogSchet.cxButton1Click(Sender: TObject);
begin


if  VarToStr(cxButtonEditID_Sch.EditValue)<> '' then      //100% гарантирует невозможность записи заместо id_schet -1-ки
begin
  if IsSchetUsed(id_sch) then
  begin
    if cxButtonEditID_Sch.Text <> '' then
    begin
        if Local_Mode = 'Insert' then  //Если режим "Вставки"
        begin
                pFIBStoredProc.ParamByName('D_ID_SP_KASS').AsInt64      := m.pFIBDataSetKassaID_SP_KASS.AsVariant;
                pFIBStoredProc.ParamByName('D_ID_SCH').AsInt64          := id_sch;
                pFIBStoredProc.ParamByName('D_DATE_BEGIN').AsDateTime   := m.pFIBDataSetKassaDATE_CLOSE.AsDateTime;
                pFIBStoredProc.ParamByName('D_DATE_END').AsString       := '31.12.2999';
                        if cxCheckBoxSchDef.Checked then
                                pFIBStoredProc.ParamByName('D_FLAG_SCH_DEFAULT').AsInteger := 1
                        else
                                pFIBStoredProc.ParamByName('D_FLAG_SCH_DEFAULT').AsInteger := 0;
                pFIBStoredProc.ParamByName('D_ID_USER').AsInt64         := id_user;
                pFIBStoredProc.StoredProcName   := 'KASSA_SP_SCH_SYSTEM_INSERT';
                pFIBTransactionWrite.StartTransaction;
                try
                        pFIBStoredProc.Prepare;
                        pFIBStoredProc.ExecProc;
                        pFIBTransactionWrite.Commit;
                        close;
                except on E:Exception do
                begin
                        pFIBTransactionWrite.Rollback;
                        ShowMessage(E.Message);
                end;

        end;
        end;

        if Local_Mode = 'Update' then   //Если режим "Обновления"
        begin
                pFIBStoredProc.StoredProcName   := 'KASSA_SP_SCH_SYSTEM_UPDATE';
                pFIBStoredProc.ParamByName('NEW_ID_SCH').AsInt64        := id_sch;
                pFIBStoredProc.ParamByName('NEW_ID_USER').AsInt64       := m.pFIBDataSetKassaID_USER.AsInt64;
                if cxCheckBoxSchDef.Checked then
                        pFIBStoredProc.ParamByName('NEW_FLAG_SCH').AsInteger := 1
                else
                        pFIBStoredProc.ParamByName('NEW_FLAG_SCH').AsInteger := 0;

                pFIBStoredProc.ParamByName('D_ID_SP_KASS').AsInt64              := m.pFIBDataSetKassaID_SP_KASS.AsInt64;
                pFIBStoredProc.ParamByName('D_ID_SCH').AsInt64                  := StrToInt64(m.pFIBDataSetSchet.FBN('ID_SCH').AsString);
                pFIBStoredProc.ParamByName('D_DATE_BEGIN').AsDateTime           := m.pFIBDataSetKassaDATE_CLOSE.AsDateTime;
                pFIBStoredProc.ParamByName('D_DATE_END').AsString               := '31.12.2999';
                pFIBStoredProc.ParamByName('D_FLAG_SCH_DEFAULT').AsInteger      := m.pFIBDataSetSchet.FBN('FLAG_DEFAULT').AsInteger;


                pFIBTransactionWrite.StartTransaction;
                try
                        pFIBStoredProc.Prepare;
                        pFIBStoredProc.ExecProc;
                        pFIBTransactionWrite.Commit;
                        close;
                except on E:Exception do
                begin
                        pFIBTransactionWrite.Rollback;
                        ShowMessage(E.Message);
                end;
                end;

        end;
        end;

        if pFIBTransactionRead.Active then
                pFIBTransactionRead.Commit;
        Close;
    end //
    else
        ShowMessage(Un_R_file_Alex.KASSA_DIALOG_SCHET_MESSAGE1);
    end
    else
        ShowMessage(Un_R_file_Alex.KASSA_DIALOG_SCHET_MESSAGE2);
end;

end.
