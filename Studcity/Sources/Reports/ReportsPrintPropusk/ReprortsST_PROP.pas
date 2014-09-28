unit ReprortsST_PROP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet, frxClass, frxDBSet, cxLookAndFeelPainters, StdCtrls,
  cxButtons, frxDesgn,StudcityConst,IBase, FIBDatabase, pFIBDatabase,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxControls, cxContainer, cxEdit,
  cxLabel, cxProgressBar, DBCtrls, cxDropDownEdit, cxCalendar, ComCtrls,
  ActnList, frxBarcode, frxExportPDF;

type
  TfrmST_PROP = class(TForm)
    frxDBDataset1: TfrxDBDataset;
    pFIBDataSet: TpFIBDataSet;
    pFIBStoredProc: TpFIBStoredProc;
    cxButtonOK: TcxButton;
    frxDesigner1: TfrxDesigner;
    pFIBDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    cxButtonCancel: TcxButton;
    cxLabelCount: TcxLabel;
    cxSpinEditCount: TcxSpinEdit;
    cxProgressBar1: TcxProgressBar;
    DataSource1: TDataSource;
    pFIBDataSetTypePrint: TpFIBDataSet;
    cxLabelTypePrint: TcxLabel;
    cxLabelBegEnd: TcxLabel;
    cxDateEditBeg: TcxDateEdit;
    cxDateEditEnd: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    DBLookupComboBox: TDBLookupComboBox;
    Transaction: TpFIBTransaction;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Designer: TAction;
    frxReport: TfrxReport;
    frxDesigner2: TfrxDesigner;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxDBDataset2: TfrxDBDataset;
    DataSetPrint: TpFIBDataSet;
    frxPDFExport1: TfrxPDFExport;
    procedure cxButtonOKClick(Sender: TObject);
    procedure cxButtonCancelClick(Sender: TObject);
    procedure DesignerExecute(Sender: TObject);
  private
    constructor Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);overload;
    { Private declarations }
  public
    id_people_print:Int64;
    { Public declarations }
  end;
function PrintPropusk(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;stdcall;
exports PrintPropusk;

var
  frmST_PROP: TfrmST_PROP;
  id_people:Int64;
  type_print:Integer;
  flag_show_print:Integer;
  designer_rep:Integer;
  DATE_BEG,DATE_END:TDateTime;
implementation
{$R *.dfm}


function PrintPropusk(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;
var
  PrProp:TfrmST_PROP;
begin
  PrProp:=TfrmST_PROP.Create(AOwner,DB,id_people,type_doc_print);
  PrProp.ShowModal;
  PrProp.Free;
end;


constructor  TfrmST_PROP.Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);
var
  F_P,N_P,O_P:String;
  FAK,KURS,BUILDS,BUILDS_NUM,ROOMS,CAT_PAY:String;
  Number_Propusk:String;
  Main_ST,Main_ST_PEOPLE:String;
  i:Integer;
begin
  Inherited Create(Aowner);
  pFIBDatabase.Handle:=DBL;

  id_people_print:=id_people;
  type_print:=type_doc_print;
  cxButtonOK.Caption:=StudcityConst.Studcity_ACTION_PRINT_CONST;
  cxButtonCancel.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST;
  if type_print=0 then
    begin
      Caption:='Печать пропуска';
      cxLabelCount.Visible:=false;
      cxSpinEditCount.Visible:=false;
      cxProgressBar1.Visible:=false;
      DBLookupComboBox.Visible:=true;
      cxLabelTypePrint.Visible:=true;
      cxLabelBegEnd.Visible:=true;
      cxDateEditBeg.Visible:=true;
      cxDateEditEnd.Visible:=true;
      cxLabel1.Visible:=true;
      cxLabel2.Visible:=true;
      DBLookupComboBox.KeyValue:=6;

       With pFIBStoredProc do
        begin
        try
        StoredProcName:='ST_DT_PROP_PRINT';
        Database:=pFIBDatabase;
        Transaction:=ReadTransaction;
        ReadTransaction.StartTransaction;
        Prepare;
        ParamByName('INPUT_ID_PEOPLE').AsInt64:=id_people_print;
        ExecProc;
        cxDateEditBeg.Date:={Date;//}FieldByName('OUT_DATE_BEGIN').AsDateTime;
        cxDateEditEnd.Date:=FieldByName('OUT_DATE_END').AsDateTime;
        DATE_BEG:={Date;//}FieldByName('OUT_DATE_BEGIN').AsDateTime;
        DATE_END:=FieldByName('OUT_DATE_END').AsDateTime;
{        if DATE_BEG>DATE_END then
          begin
            //DATE_END:=StrToDate('01.07.2005');
            cxDateEditEnd.Date:=StrToDate('01.07.2005');
          end;}
        Transaction.Commit;
      except
        Transaction.Rollback;
        raise;
      end;
      end;
      ReadTransaction.Active:=true;
      pFIBDataSetTypePrint.Active:=false;
      pFIBDataSetTypePrint.Active:=true;
      pFIBDataSetTypePrint.FetchAll;

    end
    else
    begin
      Caption:='Печать бланка пропуска';
      cxLabelCount.Caption:=Studcity_ReportsST_PROP_BLANK_COUNT;
    end;
  flag_show_print:=0;
  designer_rep:=0;
end;


procedure TfrmST_PROP.cxButtonOKClick(Sender: TObject);
var
  F_P,N_P,O_P:String;
  FAK,KURS,BUILDS,BUILDS_NUM,ROOMS,CAT_PAY:String;
  Number_Propusk:String;
  Number_Propuskint64:int64;
  Main_ST,Main_ST_PEOPLE:String;
  i:Integer;
  BarCode : int64;
begin
if type_print=1 then
  begin
   cxProgressBar1.Properties.Max:=cxSpinEditCount.Value;
   for i:=1 to cxSpinEditCount.Value do
     begin
       With pFIBStoredProc do
          begin
          try
          StoredProcName:='ST_PRINT_PROPUSK';
          Database:=pFIBDatabase;
          Transaction:=ReadTransaction;
          ReadTransaction.StartTransaction;
          Prepare;
          ParamByName('INPUT_ID_PEOPLE').AsInt64:=id_people_print;
          ParamByName('INPUT_TYPE_DOC').AsInteger:=type_print;
          ExecProc;
          Number_Propusk:=FieldByName('OUT_NUMBER_PROPUSK').AsString;
          Main_ST:=FieldByName('OUT_MAIN_DEP').AsString;
          Main_ST_PEOPLE:=FieldByName('OUT_MAIN_PEOPLE').AsString;
          Transaction.Commit;
        except
          Transaction.Rollback;
          raise;
        end;
        end;
        frxReport.Clear;
        frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PeoplePROP'+'.fr3');
        frxReport.Variables.Clear;
        frxReport.Variables['MAIN_DEP']:=''''+Main_ST+'''';
        frxReport.Variables['MAIN_PEOPLE']:=''''+Main_ST_PEOPLE+'''';
        frxReport.Variables['MAIN_NUMBER_PROPUSK']:=''''+Number_Propusk+'''';
        frxReport.Variables['NAME_PROP']:=''''+Studcity_ReportsST_PROP_NAME+'''';
        frxReport.Variables['OSN_PROP']:=''''+Studcity_ReportsST_PROP_OSN+'''';
        frxReport.Variables['ROOMS_PROP']:=''''+Studcity_ReportsST_PROP_ROOM+'''';
        frxReport.Variables['FAM_PROP']:=''''+Studcity_ReportsST_PROP_FAM_P+'''';
        frxReport.Variables['IMYA_PROP']:=''''+Studcity_ReportsST_PROP_NAME_P+'''';
        frxReport.Variables['OTCH_PROP']:=''''+Studcity_ReportsST_PROP_OTDH_P+'''';
        frxReport.Variables['CAT_PROP']:=''''+Studcity_ReportsST_PROP_CAT+'''';
        frxReport.Variables['SROK']:=''''+Studcity_ReportsST_PROP_SROK+'''';
        frxReport.Variables['DIR_PROP']:=''''+Studcity_ReportsST_PROP_DIR+'''';
        frxReport.Variables['DIR0_PROP']:=''''+Studcity_ReportsST_PROP_DIR0+'''';
        frxReport.DesignReport;
        if flag_show_print=0 then
          begin
            frxReport.PrintOptions.ShowDialog:=true;
            flag_show_print:=1;
          end
          else
          begin
            frxReport.PrintOptions.ShowDialog:=false;
          end;
        frxReport.PrepareReport();
        frxReport.Print;
        cxProgressBar1.Position:=i;
        Refresh;
      end;
  end;
if type_print=0 then
  begin
     if DBLookupComboBox.KeyValue<1 then
       begin
          MessageBox(handle,'Не выбрана причина печати пропуска','Внимание',MB_ICONWARNING or MB_OK);
          Exit;
       end;
{      if (DATE_END<Now) then
        begin
          MessageBox(handle,'Период действия пропуска не попадает в текущую категорию.','Внимание!',MB_ICONWARNING or MB_OK);
          Exit;
        end;}
      if (DATE_BEG>=cxDateEditBeg.date) then
        begin
          DATE_BEG:=cxDateEditBeg.date;
        end;

      if (DATE_END<=cxDateEditEnd.date) then
        begin
          DATE_END:=cxDateEditEnd.date;
        end;

     With pFIBStoredProc do
        begin
        try
        StoredProcName:='ST_PRINT_PROPUSK';
        Database:=pFIBDatabase;
        Transaction:=ReadTransaction;
        ReadTransaction.StartTransaction;
        Prepare;
        ParamByName('INPUT_ID_PEOPLE').AsInt64:=id_people_print;
        ParamByName('INPUT_TYPE_DOC').AsInteger:=type_print;
        ExecProc;
        Number_Propusk:=FieldByName('OUT_NUMBER_PROPUSK').AsString;
        Number_Propuskint64:=FieldByName('OUT_NUMBER_PROPUSK').AsInt64;
        Main_ST:=FieldByName('OUT_MAIN_DEP').AsString;
        Main_ST_PEOPLE:=FieldByName('OUT_MAIN_PEOPLE').AsString;
        Transaction.Commit;
      except
        Transaction.Rollback;
        raise;
      end;
      end;
       With pFIBStoredProc do
        begin
        try
        StoredProcName:='ST_DT_PROP_PRINT';
        Database:=pFIBDatabase;
        Transaction:=ReadTransaction;
        ReadTransaction.StartTransaction;
        Prepare;
        ParamByName('INPUT_ID_PEOPLE').AsInt64:=id_people_print;
        ExecProc;
        N_P:=FieldByName('OUNT_IMYA').AsString;
        F_P:=FieldByName('OUT_FAM').AsString;
        O_P:=FieldByName('OUT_OTCHESTVO').AsString;
        FAK:=FieldByName('OUT_FAK').AsString;
        KURS:=FieldByName('OUT_KURS').AsString;
        BUILDS:=FieldByName('OUT_BUILDS').AsString;
        BUILDS_NUM:=FieldByName('OUT_BUILDS_NUM').AsString;
        ROOMS:=FieldByName('OUT_ROOMSTR').AsString;
        DATE_BEG:=cxDateEditBeg.date;
        DATE_END:=cxDateEditEnd.date;
        CAT_PAY:=FieldByName('OUT_CAT_PAY').AsString;
        Transaction.Commit;
      except
        Transaction.Rollback;
        raise;
      end;
      end;

      DataSetPrint.Close;
      DataSetPrint.SQLs.SelectSQL.Text := 'Select * from ST_DT_PROP_PRINT(:INPUT_ID_PEOPLE)';
      DataSetPrint.ParamByName('INPUT_ID_PEOPLE').AsInt64 := id_people_print;
      DataSetPrint.Open;

      frxReport.Clear;
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PeoplePROPReal.fr3');
      frxReport.Variables.Clear;
      frxReport.Variables['FAM']:=''''+F_P+'''';
      frxReport.Variables['IMYA']:=''''+N_P+'''';
      frxReport.Variables['OTCH']:=''''+O_P+'''';
      frxReport.Variables['FAK']:=''''+FAK+'''';
      frxReport.Variables['KURS']:=''''+KURS+'''';
      frxReport.Variables['BUILDS']:=''''+BUILDS+'''';
      frxReport.Variables['BUILDS_NUM']:=''''+BUILDS_NUM+'''';
      frxReport.Variables['ROOMS']:=''''+ROOMS+'''';
      frxReport.Variables['DATE_BEG']:=''''+DateToStr(DATE_BEG)+'''';
      frxReport.Variables['DATE_END']:=''''+DateToStr(DATE_END)+'''';
      frxReport.Variables['MAIN_DEP']:=''''+Main_ST+'''';
      frxReport.Variables['MAIN_PEOPLE']:=''''+Main_ST_PEOPLE+'''';
      frxReport.Variables['MAIN_NUMBER_PROPUSK']:=''''+Number_Propusk+'''';
      frxReport.Variables['NAME_CAT_PAY']:=''''+CAT_PAY+'''';
      frxReport.Variables['NAME_PROP']:=''''+Studcity_ReportsST_PROP_NAME+'''';
      frxReport.Variables['OSN_PROP']:=''''+Studcity_ReportsST_PROP_OSN_REAL+'''';
      frxReport.Variables['ROOMS_PROP']:=''''+Studcity_ReportsST_PROP_ROOM+'''';
      frxReport.Variables['FAM_PROP']:=''''+Studcity_ReportsST_PROP_FAM_P+'''';
      frxReport.Variables['IMYA_PROP']:=''''+Studcity_ReportsST_PROP_NAME_P+'''';
      frxReport.Variables['OTCH_PROP']:=''''+Studcity_ReportsST_PROP_OTDH_P+'''';
      frxReport.Variables['CAT_PROP']:=''''+Studcity_ReportsST_PROP_CAT+'''';
      frxReport.Variables['SROK1']:=''''+Studcity_ReportsST_PROP_SROK1+'''';
      frxReport.Variables['SROK2']:=''''+Studcity_ReportsST_PROP_SROK2+'''';
      frxReport.Variables['SROKBEG']:=''''+DateToStr(DATE_BEG)+'''';
      frxReport.Variables['SROKEND']:=''''+DateToStr(DATE_END)+'''';
      frxReport.Variables['DIR_PROP']:=''''+Studcity_ReportsST_PROP_DIR+'''';
      frxReport.Variables['DIR0_PROP']:=''''+Studcity_ReportsST_PROP_DIR0+'''';
      frxReport.Variables['NAME_FAK']:=''''+Studcity_ReportsST_PROP_FAK+'''';
      frxReport.Variables['NAME_KURS']:=''''+Studcity_ReportsST_PROP_KURS+'''';
      frxReport.Variables['NAME_VUDAN']:=''''+Studcity_ReportsST_PROP_VUDAN+'''';
      frxReport.Variables['DATE_VUDAN']:=''''+DateToStr(Now)+'''';
      if designer_rep=1 then
        begin
          frxReport.DesignReport;
        end
        else
        begin
          frxReport.PrepareReport();
          frxReport.PrintOptions.ShowDialog:=false;
          frxReport.Print;

          //записываем пропуск на сервер
           With pFIBStoredProc do
            begin
            try
            StoredProcName:='ST_DT_PASS_INSERT';
            Database:=pFIBDatabase;
            Transaction:=ReadTransaction;
            ReadTransaction.StartTransaction;
            Prepare;
            ParamByName('ID_PEOPLE').AsInt64:=id_people_print;
            ParamByName('NOM').AsInteger:=DBLookupComboBox.KeyValue;
            ParamByName('NOM_PROP').AsInt64:=Number_Propuskint64;
            ParamByName('DATE_BEG').AsDate:=DATE_BEG;
            ParamByName('DATE_END').AsDate:=DATE_END;
            ExecProc;
            Transaction.Commit;
          except
            begin
            Transaction.Rollback;
            ShowMessage('Ошибка при сохранении пропуска. Обратитесь к администратору!!!');
            raise;
            end;
          end;
          end;
         end;

      Close;
  end;
end;

procedure TfrmST_PROP.cxButtonCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmST_PROP.DesignerExecute(Sender: TObject);
begin
if designer_rep=0 then
  begin
    designer_rep:=1;
    StatusBar1.Panels[0].Text:='Режим отладки отчетов';
  end
  else
  begin
    designer_rep:=0;
    StatusBar1.Panels[0].Text:='';
  end;
end;

end.
