{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uAddMetall;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxLabel, cxTextEdit, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ClassInvKart,
  DB, FIBDataSet, pFIBDataSet, cxCurrencyEdit, MainInvKartForm, 
  Mask, ToolEdit, CurrEdit, FIBDatabase, pFIBDatabase, ActnList, uResources;

type
  TfmAddDragMetall = class(TForm)
    cxButtonAdd: TcxButton;
    cxButtonClose: TcxButton;
    cxLookupComboBoxMetall: TcxLookupComboBox;
    cxLabelMetall: TcxLabel;
    cxLabelKol: TcxLabel;
    pFIBDataSetSelData: TpFIBDataSet;
    DataSourceSel: TDataSource;
    pFIBDataSetSelDataID_DRAG_MET: TFIBBCDField;
    pFIBDataSetSelDataNAME: TFIBStringField;
    pFIBTransaction1: TpFIBTransaction;
    ActionList1: TActionList;
    Action1: TAction;
    curencyEditKol: TcxCurrencyEdit;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure curencyEditKol1Exit(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
        FlagNaAdd : boolean;
        myform : TfmMainIvKartForm;
        long_pole : string;
        prap_flag, d : integer;
        zpt, zpt1 : string;
  public
        constructor Create(mform: TfmMainIvKartForm; Flag : boolean); reintroduce; overload;
  end;

var
    fmAddDragMetall: TfmAddDragMetall;

implementation

{$R *.dfm}
constructor TfmAddDragMetall.Create(mform: TfmMainIvKartForm; Flag: boolean);
var
   i : integer;
begin
    inherited Create(nil);
    myform := mform;
    FlagNaAdd := flag;
    pFIBTransaction1.DefaultDatabase := myform.DatabaseMain;
    pFIBDataSetSelData.Database:= myform.DatabaseMain;
    pFIBDataSetSelData.Transaction := pFIBTransaction1;

    pFIBTransaction1.StartTransaction;

    pFIBDataSetSelData.Active:=true;
    cxLabelMetall.Caption := MAT_INV_metall_Checked_metall;
    cxLabelKol.Caption    := MAT_INV_metall_Add_kol;
    cxLabelMetall.Width   := 130;
    cxLabelKol.Width      := 130;
    If FlagNaAdd = true then
       begin
           Caption := MAT_INV_system_name + MAT_INV_metall_Add_new_metall;
           cxButtonAdd.Caption := MAT_INV_Add;
           cxButtonClose.caption := MAT_INV_Cansel;
       end else
              begin
                  Caption := MAT_INV_system_name + MAT_INV_metall_Change_metall;
                  cxLookupComboBoxMetall.Text := myform.DataSetDrag.FieldByName('DRAG_NAME').AsString;
                  curencyEditKol.Text := myform.DataSetDrag.FieldByName('DRAG_KOL').AsString;
                  cxButtonAdd.Caption := MAT_INV_Change;
                  cxButtonClose.caption := MAT_INV_Cansel;
                  prap_flag := 0;
        d         := 0;
       { zpt := curencyEditKol.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(curencyEditKol.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if (zpt[i] <> ',') and (zpt[i] <> '.') then
            begin
                prap_flag := 1;
            end;
            if (zpt[i] = ',') or (zpt[i] = '.') then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if (zpt[StrToInt(long_pole)-1] = ',') or (zpt[StrToInt(long_pole)-1] = '.') then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
            if (zpt[StrToInt(long_pole)-2] = ',') or (zpt[StrToInt(long_pole)-2] = '.') then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 3;
                end;
            end;
            if (zpt[StrToInt(long_pole)-3] = ',') or (zpt[StrToInt(long_pole)-3] = '.') then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 4;
                end;
            end;
            if (zpt[StrToInt(long_pole)-4] = ',') or (zpt[StrToInt(long_pole)-4] = '.') then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 5;
                end;
            end;
            if (zpt[StrToInt(long_pole)-5] = ',') or (zpt[StrToInt(long_pole)-5] = '.') then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 6;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+'.000000';
                    curencyEditKol.Clear;
                    curencyEditKol.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                curencyEditKol.Clear;
                curencyEditKol.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                curencyEditKol.Clear;
                curencyEditKol.Text :=zpt1+'00000';
                d := 0;
            end;
            if (d = 3) and (prap_flag = 0) then
            begin
                curencyEditKol.Clear;
                curencyEditKol.Text :=zpt1+'0000';
                d := 0;
            end;
            if (d = 4) and (prap_flag = 0) then
            begin
                curencyEditKol.Clear;
                curencyEditKol.Text :=zpt1+'000';
                d := 0;
            end;
            if (d = 5) and (prap_flag = 0) then
            begin
                curencyEditKol.Clear;
                curencyEditKol.Text :=zpt1+'00';
                d := 0;
            end;
            if (d = 6) and (prap_flag = 0) then
            begin
                curencyEditKol.Clear;
                curencyEditKol.Text :=zpt1+'0';
                d := 0;
            end;   }
              end; 
end;


procedure TfmAddDragMetall.cxButtonCloseClick(Sender: TObject);
begin
    close;
end;

procedure TfmAddDragMetall.curencyEditKol1Exit(Sender: TObject);
var
    i : integer;
begin
    {    prap_flag := 0;
        d         := 0;
        zpt := curencyEditKol.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(curencyEditKol.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if (zpt[i] <> ',') and (zpt[i] <> '.') then
            begin
                prap_flag := 1;
            end;
            if (zpt[i] = ',') or (zpt[i] = '.') then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if (zpt[StrToInt(long_pole)-1] = ',') or (zpt[StrToInt(long_pole)-1] = '.') then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
            if (zpt[StrToInt(long_pole)-2] = ',') or (zpt[StrToInt(long_pole)-2] = '.') then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 3;
                end;
            end;
            if (zpt[StrToInt(long_pole)-3] = ',') or (zpt[StrToInt(long_pole)-3] = '.') then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 4;
                end;
            end;
            if (zpt[StrToInt(long_pole)-4] = ',') or (zpt[StrToInt(long_pole)-4] = '.') then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 5;
                end;
            end;
            if (zpt[StrToInt(long_pole)-5] = ',') or (zpt[StrToInt(long_pole)-5] = '.') then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 6;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+'.000000';
                    curencyEditKol.Clear;
                    curencyEditKol.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                curencyEditKol.Clear;
                curencyEditKol.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                curencyEditKol.Clear;
                curencyEditKol.Text :=zpt1+'00000';
                d := 0;
            end;
            if (d = 3) and (prap_flag = 0) then
            begin
                curencyEditKol.Clear;
                curencyEditKol.Text :=zpt1+'0000';
                d := 0;
            end;
            if (d = 4) and (prap_flag = 0) then
            begin
                curencyEditKol.Clear;
                curencyEditKol.Text :=zpt1+'000';
                d := 0;
            end;
            if (d = 5) and (prap_flag = 0) then
            begin
                curencyEditKol.Clear;
                curencyEditKol.Text :=zpt1+'00';
                d := 0;
            end;
            if (d = 6) and (prap_flag = 0) then
            begin
                curencyEditKol.Clear;
                curencyEditKol.Text :=zpt1+'0';
                d := 0;
            end;  }
end;

procedure TfmAddDragMetall.Action1Execute(Sender: TObject);
var
    j, id, Res : int64;
    convertSel : String;
    T : TfmMainIvKartForm;
begin
    convertSel:=cxLookupComboBoxMetall.Text;
    convertSel := VArToStr(cxLookupComboBoxMetall.Properties.DataController.GetRecordId(cxLookupComboBoxMetall.Properties.DataController.GetSelectedRowIndex(0)));
    if FlagNaAdd = true then
    begin
          if (cxLookupComboBoxMetall.Text = '') or (curencyEditKol.Text = '') then
           begin
            ShowMessage(MAT_INV_metall_not_all_Row);
            exit;
           end
           else
            begin
             DecimalSeparator := ',';
             id := myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
             j := AddMetall(myform.DataSetKart.FieldByName('R_ID_KART').AsVariant, StrToInt(convertSel), StringReplace(curencyEditKol.Text,',','.',[]));
              If j > 0 then
              begin
                   myform.ActionUpdateMetallExecute(Sender);
                   //myform.DataSetPapka.Locate('ID_INV_GRP', id, []);
                   DecimalSeparator := ',';
              end;
           end;
        close;
    end;
    if FlagNaAdd = false then
    begin
        if (cxLookupComboBoxMetall.Text = '') or (curencyEditKol.Text = '') then
           begin
            ShowMessage(MAT_INV_metall_not_all_Row);
            exit;
           end
           else
        begin
            begin
            id := myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
            DecimalSeparator := ',';
            j := myform.DataSetDrag.FieldByName('ID_FOR_DEL').AsVariant;
            ChangeMetall(j, StrToInt(convertSel), StringReplace(curencyEditKol.Text,',','.',[]));
            myform.ActionUpdateMetallExecute(Sender);
            //myform.Special_actionExecute(Sender);
            //myform.DataSetPapka.Locate('ID_INV_GRP', id, []);
            close;
        end;
        end;
    end;
end;

end.
