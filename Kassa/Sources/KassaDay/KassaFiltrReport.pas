unit KassaFiltrReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxRadioGroup, cxButtons,
  cxSpinEdit, cxLabel, DB, FIBDataSet, pFIBDataSet, frxClass, frxDBSet,
  cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, FIBDatabase, pFIBDatabase, PFormDay, ExtCtrls,
  cxGroupBox;

type
  TfmKassaFiltrReport = class(TForm)
    cxDateEdit1: TcxDateEdit;
    DBDatasetBookRash: TfrxDBDataset;
    DataSetBookPrih: TpFIBDataSet;
    DBDatasetBookPrih: TfrxDBDataset;
    cxLabel22: TcxLabel;
    cxDateEdit2: TcxDateEdit;
    cxCheckBoxShow: TcxCheckBox;
    cxButtonPrint: TcxButton;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    cxRadioButtonPrihod: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    pFIBDatabase1: TpFIBDatabase;
    cxCheckBoxEdit: TcxCheckBox;
    pFIBTransaction1: TpFIBTransaction;
    cxButtonClose: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel27: TcxLabel;
    cxSpinEdit11: TcxSpinEdit;
    cxLabel28: TcxLabel;
    ReportBookRash: TfrxReport;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxGroupBox5: TcxGroupBox;
    DataSetBookPrihPRIHOD: TFIBStringField;
    DataSetBookPrihR_NAME_PREDPR: TFIBStringField;
    DataSetBookPrihNUMBER: TFIBStringField;
    DataSetBookPrihFIO: TFIBStringField;
    DataSetBookPrihOSNOVANIE: TFIBStringField;
    DataSetBookPrihSUMMA: TFIBBCDField;
    DataSetBookPrihDATE_DOC: TFIBDateField;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    ReportBookPrih: TfrxReport;
    procedure cxButtonPrintClick(Sender: TObject);
    procedure cxButtonCloseClick(Sender: TObject);
  private
      myform        : TfmPrintFormDay;
      id_user : int64;
  public
   constructor Create(AOwner: TComponent; db : TpFIBDatabase; mform : TfmPrintFormDay); reintroduce; overload;
  end;


 {
  fmKassaFiltrReport: TfmKassaFiltrReport; }

implementation
uses GlobalSPR, Un_R_file_Alex;
{$R *.dfm}
constructor TfmKassaFiltrReport.Create(AOwner: TComponent; db : TpFIBDatabase; mform : TfmPrintFormDay);
begin
    inherited Create (AOwner);

    myform     := mform;

    pFIBDatabase1.Handle                         := DB.Handle;

    DataSetBookPrih.Database    := pFIBDatabase1;
    DataSetBookPrih.Transaction := pFIBTransaction1;

    cxDateEdit1.Date                      := myform.current_day;
    cxDateEdit2.Date                      := myform.current_day;
    Caption                               := Un_R_file_Alex.KASSA_PRINT_FILTR_WIDE;
    cxLabel1.Caption                      := Un_R_file_Alex.KASSA_BOOK_REESTR_PERIOD;
    cxCheckBoxShow.Properties.Caption     := Un_R_file_Alex.KASSA_PRINT_SHOW_OTCHET;
    cxCheckBox1.Properties.Caption        := Un_R_file_Alex.KASSA_PRINT_CUR_USER;
    cxButtonPrint.Caption                 := Un_R_file_Alex.MY_BUTTON_PRINT;
    cxButtonClose.Caption                 := Un_R_file_Alex.N_AUTOKOD_FORM_CANCLE;
    cxLabel22.Caption                     := Un_R_file_Alex.KASSA_FIND_CAP_3;
    cxRadioButtonPrihod.Caption           := Un_R_file_Alex.KASSA_FIND_CAP_7;
    cxRadioButton3.Caption                := Un_R_file_Alex.KASSA_FIND_CAP_8;
    cxRadioButton1.Caption                := Un_R_file_Alex.KASSA_PRINT_BUHG;
    cxRadioButton2.Caption                := Un_R_file_Alex.KASSA_PRINT_ALL;
    cxCheckBox1.checked           := true;
    cxCheckBox2.checked           := true;
    cxRadioButtonPrihod.checked   := true;
    cxRadioButton1.checked        := true;
    cxCheckBoxShow.checked        := true;
end;

procedure TfmKassaFiltrReport.cxButtonPrintClick(Sender: TObject);
var
    l, m, day, id_sp_kass : string;
    i, j : variant;
    ss : string;
    prih : integer;
begin
    if (cxRadioButton1.checked = true) then
    begin
        if cxCheckBox1.Checked then
        begin
            id_user :=  myform.id_user_cur;
            if  cxRadioButtonPrihod.checked then prih := 1 else
                if  cxRadioButton3.Checked then prih := 0;
            l := cxDateEdit1.Text;
            m := cxDateEdit2.Text;
            DataSetBookPrih.Close;
            DataSetBookPrih.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_GET_OTCHET_BY_USER('''+l+''','''+m+''', '+IntToStr(prih)+', '+myform.id_kas_cur+', '+IntToStr(id_user)+')';
            DataSetBookPrih.Open;
            if  cxRadioButtonPrihod.checked then
            begin
                 if cxCheckBox2.checked then ReportBookPrih.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10009_itog.fr3')
                    else ReportBookPrih.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10009.fr3');
            end else
            begin
                if cxCheckBox2.checked then ReportBookPrih.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10010_itog.fr3')
                    else ReportBookPrih.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10010.fr3');
            end;
            //ReportBookPrih.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10009.fr3');
            ReportBookPrih.Variables['date_beg']   := QuotedStr(l);
            ReportBookPrih.Variables['date_end']   := QuotedStr(m);
            ReportBookPrih.Variables['count_page'] := cxSpinEdit11.value;
            ReportBookPrih.Variables['id_user']    := QuotedStr(IntToStr(id_user));
            ReportBookPrih.Variables['comp']       := QuotedStr(GetComputerNetName);
            if not cxCheckBoxEdit.Checked then
            begin
                if not cxCheckBoxShow.Checked then
                begin
                      ReportBookPrih.Print;
                end
                else ReportBookPrih.ShowReport(true);
            end;
        end;
        if cxCheckBox1.Checked = false then
        begin
            id_user :=  -1;
            if  cxRadioButtonPrihod.checked then prih := 1 else
                if  cxRadioButton3.Checked then prih := 0;
            l := cxDateEdit1.Text;
            m := cxDateEdit2.Text;
            DataSetBookPrih.Close;
            DataSetBookPrih.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_GET_OTCHET_BY_USER('''+l+''','''+m+''', '+IntToStr(prih)+', '+myform.id_kas_cur+', '+IntToStr(id_user)+')';
            DataSetBookPrih.Open;
            if  cxRadioButtonPrihod.checked then
            begin
                 if cxCheckBox2.checked then ReportBookPrih.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10009_itog.fr3')
                    else ReportBookPrih.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10009.fr3');
            end else
            begin
                if cxCheckBox2.checked then ReportBookPrih.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10010_itog.fr3')
                    else ReportBookPrih.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10010.fr3');
            end;
            ReportBookPrih.Variables['date_beg']   := QuotedStr(l);
            ReportBookPrih.Variables['date_end']   := QuotedStr(m);
            ReportBookPrih.Variables['count_page'] := cxSpinEdit11.value;
            id_user :=  myform.id_user_cur;
            ReportBookPrih.Variables['id_user']    := QuotedStr(IntToStr(id_user));
            ReportBookPrih.Variables['comp']       := QuotedStr(GetComputerNetName);
            if not cxCheckBoxEdit.Checked then
            begin
                if not cxCheckBoxShow.Checked then
                begin
                      ReportBookPrih.Print;
                end
                else ReportBookPrih.ShowReport(true);
            end;
        end;
    end;
    if (cxRadioButton2.checked = true) then
    begin
        if cxCheckBox1.Checked then
        begin
            id_user :=  myform.id_user_cur;
            if  cxRadioButtonPrihod.checked then prih := 1 else
                if  cxRadioButton3.Checked then prih := 0;
            l := cxDateEdit1.Text;
            m := cxDateEdit2.Text;
            DataSetBookPrih.Close;
            DataSetBookPrih.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_GET_BOOK_LIST('''+l+''','''+m+''', '+IntToStr(prih)+', '+myform.id_kas_cur+', '+IntToStr(id_user)+')';
            DataSetBookPrih.Open;
            if  cxRadioButtonPrihod.checked then
            begin
                 if cxCheckBox2.checked then ReportBookPrih.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10009_itog.fr3')
                    else ReportBookPrih.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10009.fr3');
            end else
            begin
                if cxCheckBox2.checked then ReportBookPrih.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10010_itog.fr3')
                    else ReportBookPrih.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10010.fr3');
            end;
            //ReportBookPrih.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10009.fr3');
            ReportBookPrih.Variables['date_beg']   := QuotedStr(l);
            ReportBookPrih.Variables['date_end']   := QuotedStr(m);
            ReportBookPrih.Variables['count_page'] := cxSpinEdit11.value;
            ReportBookPrih.Variables['id_user']    := QuotedStr(IntToStr(id_user));
            ReportBookPrih.Variables['comp']       := QuotedStr(GetComputerNetName);
            if not cxCheckBoxEdit.Checked then
            begin
                if not cxCheckBoxShow.Checked then
                begin
                      ReportBookPrih.Print;
                end
                else ReportBookPrih.ShowReport(true);
            end;
        end;
        if cxCheckBox1.Checked = false then
        begin
            id_user :=  -1;
            if  cxRadioButtonPrihod.checked then prih := 1 else
                if  cxRadioButton3.Checked then prih := 0;
            l := cxDateEdit1.Text;
            m := cxDateEdit2.Text;
            DataSetBookPrih.Close;
            DataSetBookPrih.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_GET_BOOK_LIST('''+l+''','''+m+''', '+IntToStr(prih)+', '+myform.id_kas_cur+', '+IntToStr(id_user)+')';
            DataSetBookPrih.Open;
            if  cxRadioButtonPrihod.checked then
            begin
                 if cxCheckBox2.checked then ReportBookPrih.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10009_itog.fr3')
                    else ReportBookPrih.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10009.fr3');
            end else
            begin
                if cxCheckBox2.checked then ReportBookPrih.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10010_itog.fr3')
                    else ReportBookPrih.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10010.fr3');
            end;
            ReportBookPrih.Variables['date_beg']   := QuotedStr(l);
            ReportBookPrih.Variables['date_end']   := QuotedStr(m);
            ReportBookPrih.Variables['count_page'] := cxSpinEdit11.value;
            id_user :=  myform.id_user_cur;
            ReportBookPrih.Variables['id_user']    := QuotedStr(IntToStr(id_user));
            ReportBookPrih.Variables['comp']       := QuotedStr(GetComputerNetName);
            if not cxCheckBoxEdit.Checked then
            begin
                if not cxCheckBoxShow.Checked then
                begin
                      ReportBookPrih.Print;
                end
                else ReportBookPrih.ShowReport(true);
            end;
        end;
    end;
end;

procedure TfmKassaFiltrReport.cxButtonCloseClick(Sender: TObject);
begin
    close;
end;

end.
