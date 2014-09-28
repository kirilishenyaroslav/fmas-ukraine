{************************************************************************
* Unit KassaSystemMain.					                *
*							                *
* Описание предназначения(работы) модуля: справочник касс и счетов      *
* Copyright ©  Год 2006, Автор: Ворновских Макс                         *
*************************************************************************}

unit KassaAddDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls,
  cxContainer, cxEdit, cxTextEdit, ExtCtrls, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxCheckBox,KassaSystemMain, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase;

type
  TfmKassaAddDialog = class(TForm)
    cxEditShortName: TcxTextEdit;
    cxEditLongName: TcxTextEdit;
    cxDateEditBegin: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxCheckBox1: TcxCheckBox;
    pFIBTransactionDialog: TpFIBTransaction;
    pFIBSPInsert: TpFIBStoredProc;
    pFIBTransactionUpdate: TpFIBTransaction;
    pFIBQueryUpdate: TpFIBQuery;
    pFIBDatabase1: TpFIBDatabase;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    LocalMode:String;
    m : TfmKassaSystemMain;
  public
    local_id:String;  //Возвращает ID вставленой записи
    local_id_for_update : int64; //Возвращает ID обновлённой записи
    constructor Create( var MainForm : TfmKassaSystemMain; AOwner: TComponent; Mode:String); reintroduce;

  end;

var
  fmKassaAddDialog: TfmKassaAddDialog;



implementation
Uses Un_R_file_Alex;
{$R *.dfm}


constructor TfmKassaAddDialog.Create( var MainForm : TfmKassaSystemMain; AOwner: TComponent; Mode:String);
begin
        inherited Create (AOwner);
        m                                     := MainForm;
        pFIBTransactionDialog.DefaultDatabase := m.pFIBDatabase1;
        pFIBTransactionUpdate.DefaultDatabase := m.pFIBDatabase1;
        pFIBSPInsert.Database                 := m.pFIBDatabase1;
        pFIBSPInsert.Transaction              := pFIBTransactionDialog;
        
        pFIBTransactionDialog.StartTransaction;

        local_id :='';
        local_id_for_update := StrToInt64(MainForm.pFIBDataSetKassa.FieldByName('ID_SP_KASS').AsString);
         //Добавление записей для редактирования левого справочника
        LocalMode:=Mode;
        if(Mode='AddLeft')then
        begin
                {}
                Caption           := Un_R_file_Alex.KASSA_ADD_KASSA_FORM1;
                cxButton1.Caption := Un_R_file_Alex.KASSA_MY_BUTTON_ADD1;
                cxLabel1.Caption  := Un_R_file_Alex.KASSA_ADD_KASSA_FORM_SHORT1;
                cxLabel2.Caption  := Un_R_file_Alex.KASSA_ADD_KASSA_FORM_FULL1;
                cxLabel3.Caption  := Un_R_file_Alex.KASSA_DATE_BEG_LABEL1;
                cxCheckBox1.Properties.Caption:=Un_R_file_Alex.KASSA_FLAG_LOAD_DEF_SYSTEM1;

        end;
        //Модификация для редактирования левого справочника
        if(Mode='UpdateLeft')then
        begin
                {}
                Caption:=Un_R_file_Alex.KASSA_UPDATE_KASSA_FORM1;
                cxButton1.Caption:=Un_R_file_Alex.KASSA_MY_BUTTON_ADD1;
                cxLabel1.Caption:=Un_R_file_Alex.KASSA_UPDATE_KASSA_FORM_SHORT1;
                cxLabel2.Caption:=Un_R_file_Alex.KASSA_UPDATE_KASSA_FORM_FULL1;
                cxLabel3.Caption:=Un_R_file_Alex.KASSA_DATE_BEG_LABEL1;
                cxCheckBox1.Properties.Caption:=Un_R_file_Alex.KASSA_FLAG_LOAD_DEF_SYSTEM1;
                cxButton1.Caption:=Un_R_file_Alex.KASSA_MY_BUTTON_UPDATE1;
                {Заполнение полей "старыми" значениями}

                cxEditShortName.Text:=MainForm.pFIBDataSetKassa.FieldByName('SHORT_NAME_KASS').AsString;
                cxEditLongName.Text:=MainForm.pFIBDataSetKassa.FieldByName('FULL_NAME_KASS').AsString;
                cxDateEditBegin.EditValue:=MainForm.pFIBDataSetKassa.FieldByName('DATE_CLOSE').AsVariant;
        end;

        cxButton2.Caption:=Un_R_file_Alex.MY_BUTTON_CLOSE1;
end;

procedure TfmKassaAddDialog.cxButton2Click(Sender: TObject);
begin
        Close;
end;

procedure TfmKassaAddDialog.cxButton1Click(Sender: TObject);
var params:array [1..4] of Variant;
begin
        {Режим добавления записи}
        if LocalMode='AddLeft' then
        begin
                if (cxEditShortName.Text<>'') and (cxEditLongName.Text<>'') and (cxDateEditBegin.EditValue<>NULL)and (length(cxEditLongName.Text)<151) and (length(cxEditShortName.Text)<51)then
                begin
//                        pFIBTransactionDialog.StartTransaction;

                        params[1] := Variant(cxEditLongName.Text);
                        params[2] := Variant(cxEditShortName.Text);
                        params[3] := Variant(cxDateEditBegin.EditValue);
                        params[4] := Variant(1);  //Сказал Александр
                        pFIBSPInsert.SetParamValues(params);
                        try
                                pFIBSPInsert.Prepare;
                                pFIBSPInsert.ExecProc;
                                local_id := pFIBSPInsert.ParamByName('R_ID').AsString;
                                pFIBTransactionDialog.Commit;
                                close;
                        except on E:Exception do
                                begin
                                pFIBTransactionDialog.Rollback;
                                ShowMessage(E.Message);
                                end;
                        end;
                end
                else
                        ShowMessage(Un_R_file_Alex.KASSA_EMPTY_MESSAGE1);
        end;
        {Режим обновления записи}
        if LocalMode='UpdateLeft' then
        begin
                if (cxEditShortName.Text<>'') and (cxEditLongName.Text<>'') and (cxDateEditBegin.Text<>'') then
                begin
                        pFIBQueryUpdate.Database    := m.pFIBDatabase1;
                        pFIBQueryUpdate.Transaction := pFIBTransactionUpdate;
                        pFIBTransactionUpdate.StartTransaction;

                        pFIBQueryUpdate.SQL.Clear;
                        pFIBQueryUpdate.SQL.Add('update KASSA_SP_KASS');
                        pFIBQueryUpdate.SQL.Add('set FULL_NAME_KASS='''+cxEditLongName.Text+''',');
                        pFIBQueryUpdate.SQL.Add('SHORT_NAME_KASS='''+cxEditShortName.Text+''',');
                        pFIBQueryUpdate.SQL.Add('DATE_CLOSE='''+cxDateEditBegin.Text+'''');
                        pFIBQueryUpdate.SQL.Add('where ID_SP_KASS='+IntToStr(local_id_for_update));
                        try
                                pFIBQueryUpdate.Prepare;
                                pFIBQueryUpdate.ExecQuery;
                                pFIBTransactionUpdate.Commit;
                                close;
                        except on E:Exception do
                                begin
                                pFIBTransactionUpdate.Rollback;
                                ShowMessage(E.Message);
                                end;
                        end;
                end;
        end;
end;

end.
