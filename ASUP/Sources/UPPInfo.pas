unit UPPInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MainUnit, DB, FIBDataSet, pFIBDataSet, cxLookAndFeelPainters,
  cxControls, cxSplitter, StdCtrls, cxButtons, ExtCtrls, cxContainer,
  cxEdit, cxCheckBox, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  FIBDatabase, pFIBDatabase, FR_Class, FR_DSet, FR_DBSet, ActnList, uCommonSp, ibase,
  PersonalCommon, frxClass, frxDBSet;

type
  TfminfoPEOPLE = class(TForm)
    DataSet_SSD: TpFIBDataSet;
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    cxCheckBox4: TcxCheckBox;
    cxCheckBox5: TcxCheckBox;
    cxCheckBox6: TcxCheckBox;
    cxCheckBox7: TcxCheckBox;
    cxCheckBox8: TcxCheckBox;
    cxCheckBox9: TcxCheckBox;
    cxCheckBox10: TcxCheckBox;
    Panel3: TPanel;
    Label1: TLabel;
    cxCheckBox11: TcxCheckBox;
    Label2: TLabel;
    cxCheckBox12: TcxCheckBox;
    cxDateEdit1: TcxDateEdit;
    Label3: TLabel;
    cxCheckBox14: TcxCheckBox;
    cxCheckBox15: TcxCheckBox;
    Label4: TLabel;
    cxDateEdit2: TcxDateEdit;
    cxDateEdit3: TcxDateEdit;
    Label5: TLabel;
    cxDateEdit4: TcxDateEdit;
    Label6: TLabel;
    cxDateEdit5: TcxDateEdit;
    Label7: TLabel;
    cxCheckBox17: TcxCheckBox;
    cxTextEdit1: TcxTextEdit;
    TransRead: TpFIBTransaction;
    DataSet_SSDFIO: TFIBStringField;
    DataSet_SSDBIRTH_DATE: TFIBDateField;
    DataSet_SSDSEX: TFIBStringField;
    DataSet_SSDTN: TFIBIntegerField;
    DataSet_SSDDEP_NAME: TFIBStringField;
    DataSet_SSDID_DEP: TFIBIntegerField;
    DataSet_SSDID_UCH: TFIBIntegerField;
    DataSet_SSDUCHASTOK: TFIBStringField;
    DataSet_SSDID_POST: TFIBIntegerField;
    DataSet_SSDNAME_POST: TFIBStringField;
    DataSet_SSDOKLAD: TFIBFloatField;
    DataSet_SSDTARIF: TFIBIntegerField;
    DataSet_SSDDATE_BEG: TFIBDateField;
    DataSet_SSDREAL_DATE_END: TFIBDateField;
    DataSet_SSDID_SEX: TFIBIntegerField;
    Label8: TLabel;
    cxButton4: TcxButton;
    ActionList1: TActionList;
    Action1: TAction;
    DBTransfer: TpFIBDatabase;
    DS_Get_Data: TfrxDBDataset;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    frxReportPrint: TfrxReport;
    procedure cxButton3Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
    procedure cxCheckBox11PropertiesChange(Sender: TObject);
    procedure cxCheckBox14PropertiesChange(Sender: TObject);
    procedure cxCheckBox15PropertiesChange(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxDateEdit2Exit(Sender: TObject);
    procedure cxDateEdit3Exit(Sender: TObject);
    procedure cxDateEdit4Exit(Sender: TObject);
    procedure cxDateEdit5Exit(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
  private
        id_depart : integer;


  public
       Setings_FIO, Setings_TN, Setings_DR, Setings_Dep,
        Setings_Place, Setings_Post, Setings_ZP, Setings_DW, Setings_Sex : integer;

        DR_so_vkl, Dep_so_vkl, work_or_not, humen_or_women, tip_sel : integer;
        report_date, prefix : string;
        name_dep, DR_s, DR_po, work_in_date_s, work_in_date_po, what_work_date : variant;
        flag_look : boolean;
        
       constructor Create(AOwner: TComponent; DBH: TISC_DB_HANDLE); reintroduce; overload;
  end;


var
  fminfoPEOPLE: TfminfoPEOPLE;

implementation
uses uExportReport, UPrintComand;
{$R *.dfm}

constructor TfminfoPEOPLE.Create(AOwner: TComponent; DBH: TISC_DB_HANDLE);
begin
    inherited Create (AOwner);
    DBTransfer.Handle := DBH;

    Caption := 'Формування списків спiвробiтникiв';

    cxButton1.Caption := 'Друкувати';
    cxButton2.Caption := 'Експорт';
    cxButton3.Caption := 'Відмінити';
end;

procedure TfminfoPEOPLE.cxButton3Click(Sender: TObject);
begin
    close;
end;

procedure TfminfoPEOPLE.cxCheckBox1PropertiesChange(Sender: TObject);
begin
    if cxCheckBox1.Checked then cxCheckBox2.Checked := false else cxCheckBox2.Checked := true;
end;

procedure TfminfoPEOPLE.cxCheckBox2PropertiesChange(Sender: TObject);
begin
    if cxCheckBox2.Checked then cxCheckBox1.Checked := false else cxCheckBox1.Checked := true;
end;

procedure TfminfoPEOPLE.cxCheckBox11PropertiesChange(Sender: TObject);
begin
    if cxCheckBox11.Checked then begin Panel3.Enabled := true; end else
    begin
        Panel3.Enabled            := false;
        cxDateEdit5.EditValue     := null;
        cxDateEdit4.EditValue     := null;
        cxCheckBox17.Checked      := false;
        cxTextEdit1.Text          := '';
        cxDateEdit2.EditValue     := null;
        cxDateEdit3.EditValue     := null;
        cxDateEdit1.EditValue     := null;
        cxCheckBox12.Checked      := false;
        cxCheckBox14.Checked      := false;
        cxCheckBox15.Checked      := false;
    end;
end;

procedure TfminfoPEOPLE.cxCheckBox14PropertiesChange(Sender: TObject);
begin
    if cxCheckBox14.Checked then cxCheckBox15.Checked := false;
end;

procedure TfminfoPEOPLE.cxCheckBox15PropertiesChange(Sender: TObject);
begin
    if cxCheckBox15.Checked then cxCheckBox14.Checked := false;
end;

procedure TfminfoPEOPLE.cxButton2Click(Sender: TObject);
begin
    //ShowMessage('Вибачте, але ця функцiя не допрацьована...');
    //*** Как отображаем ФИО ***//
    if cxCheckBox1.Checked   then Setings_FIO := 1;
    if cxCheckBox2.Checked   then Setings_FIO := 2;

    //*** Как отображаем остальные поля ***//
    if cxCheckBox3.Checked   then Setings_TN    := 1 else Setings_TN    := 0;
    if cxCheckBox4.Checked   then Setings_DR    := 1 else Setings_DR    := 0;
    if cxCheckBox5.Checked   then Setings_Dep   := 1 else Setings_Dep   := 0;
    if cxCheckBox6.Checked   then Setings_Place := 1 else Setings_Place := 0;
    if cxCheckBox7.Checked   then Setings_Post  := 1 else Setings_Post  := 0;
    if cxCheckBox8.Checked   then Setings_ZP    := 1 else Setings_ZP    := 0;
    if cxCheckBox9.Checked   then Setings_DW    := 1 else Setings_DW    := 0;
    if cxCheckBox10.Checked  then Setings_Sex   := 1 else Setings_Sex   := 0;

    //*** Данные условий фильтрации ***//
    DR_s     := cxDateEdit5.Text;
    DR_po    := cxDateEdit4.Text;

    if cxCheckBox17.Checked  then Dep_so_vkl   := 1 else Dep_so_vkl   := 0;
    name_dep := cxTextEdit1.Text;

    work_in_date_s    := cxDateEdit2.Text;
    work_in_date_po   := cxDateEdit3.Text;

    work_or_not       := 0;

    if cxCheckBox12.Checked  then work_or_not      := 1;
    what_work_date    := cxDateEdit1.Text;
    report_date       := DateToStr(Date);

    humen_or_women    := 0;
    if cxCheckBox14.Checked  then humen_or_women   := 1;
    if cxCheckBox15.Checked  then humen_or_women   := 2;

    tip_sel := 0;
    //*** Параметры Построения запроса ***//
    if cxCheckBox5.Checked   then tip_sel := 1;
    if cxCheckBox6.Checked   then tip_sel := 1;
    if cxCheckBox7.Checked   then tip_sel := 1;
    if cxCheckBox8.Checked   then tip_sel := 1;
    if cxCheckBox9.Checked   then tip_sel := 1;

    if cxTextEdit1.Text<> '' then tip_sel := 1;
    if cxDateEdit2.Text<> '' then tip_sel := 1;
    if cxDateEdit3.Text<> '' then tip_sel := 1;
    if cxCheckBox12.Checked  then tip_sel := 1;
    if cxDateEdit1.Text<> '' then tip_sel := 1;

    if cxTextEdit1.Text = '' then
    begin
        id_depart      := 0;
        Dep_so_vkl     := 0;
    end;

    //*** Создаём запрос и формируем условия отбора ***//
    DataSet_SSD.close;
    DataSet_SSD.SQLs.SelectSQL.Text :='select * from ASUP_PEOPLE_PRINT_INFO('+IntToStr(Setings_FIO)+','+IntToStr(tip_sel)+','''+report_date+''','+IntToStr(work_or_not)+','+IntToStr(id_depart)+','+IntToStr(Dep_so_vkl)+')';
    //*** Параметры фильтрации ***//
    flag_look := false;
    if (DR_s <> '') and (DR_po <> '') then
    begin
        if flag_look = false then
        begin
            prefix := 'where ';
            DataSet_SSD.SelectSQL.Add(prefix +'(BIRTH_DATE between '+''''+DR_s+''''+ ' and '+''''+DR_po+''''+')');
            flag_look := true;
        end else
        begin
            prefix := 'and ';
            DataSet_SSD.SelectSQL.Add(prefix +'(BIRTH_DATE between '+''''+DR_s+''''+ ' and '+''''+DR_po+''''+')');
        end;
    end;
    if (work_in_date_s <> '') and (work_in_date_po <> '') then
    begin
        if flag_look = false then
        begin
            prefix := 'where ';
            DataSet_SSD.SelectSQL.Add(prefix +'(DATE_BEG between '+''''+work_in_date_s+''''+' AND '+''''+work_in_date_po+''''+
                                           ' OR REAL_DATE_END between '+''''+work_in_date_s+''''+' AND '+''''+work_in_date_po+''''+')');
            flag_look := true;
        end else
        begin
            prefix := 'and ';
            DataSet_SSD.SelectSQL.Add(prefix +'(DATE_BEG between '+''''+work_in_date_s+''''+' AND '+''''+work_in_date_po+''''+
                                           ' OR REAL_DATE_END between '+''''+work_in_date_s+''''+' AND '+''''+work_in_date_po+''''+')');
        end;
    end;
    if (what_work_date <> '') then
    begin
        if flag_look = false then
        begin
            prefix := 'where ';
            DataSet_SSD.SelectSQL.Add(prefix +'('+''''+what_work_date+''''+ ' between DATE_BEG AND REAL_DATE_END)');
        end else
        begin
            prefix := 'and ';
            DataSet_SSD.SelectSQL.Add(prefix +'('+''''+what_work_date+''''+ ' between DATE_BEG AND REAL_DATE_END)');
        end;
    end;
    if humen_or_women = 1 then
    begin
        if flag_look = false then
        begin
            prefix := 'where ';
            DataSet_SSD.SelectSQL.Add(prefix +'ID_SEX = '+IntToStr(humen_or_women));
        end else
        begin
            prefix := 'and ';
            DataSet_SSD.SelectSQL.Add(prefix +'ID_SEX = '+IntToStr(humen_or_women));
        end;
    end;
    if humen_or_women = 2 then
    begin
        if flag_look = false then
        begin
            prefix := 'where ';
            DataSet_SSD.SelectSQL.Add(prefix +'ID_SEX = '+IntToStr(humen_or_women));
        end else
        begin
            prefix := 'and ';
            DataSet_SSD.SelectSQL.Add(prefix +'ID_SEX = '+IntToStr(humen_or_women));
        end;
    end;

    DataSet_SSD.Open;

    frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Reports\ASUP\' + 'Asup_people_print_info.fr3');
    if (Sender as TButton).Name = 'OkButton' then
        if sDesignReport then
            frxReportPrint.DesignReport
        else
            frxReportPrint.ShowReport
    else
        ExportReportTo(frxReportPrint);
end;

procedure TfminfoPEOPLE.cxButton1Click(Sender: TObject);
var
    kill_this_param : integer;
begin
    //*** Как отображаем ФИО ***//
    if cxCheckBox1.Checked   then Setings_FIO := 1;
    if cxCheckBox2.Checked   then Setings_FIO := 2;

    //*** Как отображаем остальные поля ***//
    if cxCheckBox3.Checked   then Setings_TN    := 1 else Setings_TN    := 0;
    if cxCheckBox4.Checked   then Setings_DR    := 1 else Setings_DR    := 0;
    if cxCheckBox5.Checked   then Setings_Dep   := 1 else Setings_Dep   := 0;
    if cxCheckBox6.Checked   then Setings_Place := 1 else Setings_Place := 0;
    if cxCheckBox7.Checked   then Setings_Post  := 1 else Setings_Post  := 0;
    if cxCheckBox8.Checked   then Setings_ZP    := 1 else Setings_ZP    := 0;
    if cxCheckBox9.Checked   then Setings_DW    := 1 else Setings_DW    := 0;
    if cxCheckBox10.Checked  then Setings_Sex   := 1 else Setings_Sex   := 0;

    //*** Данные условий фильтрации ***//
    DR_s     := cxDateEdit5.Text;
    DR_po    := cxDateEdit4.Text;

    if cxCheckBox17.Checked  then Dep_so_vkl   := 1 else Dep_so_vkl   := 0;
    name_dep := cxTextEdit1.Text;

    work_in_date_s    := cxDateEdit2.Text;
    work_in_date_po   := cxDateEdit3.Text;

    work_or_not       := 0;

    if cxCheckBox12.Checked  then work_or_not      := 1;
    what_work_date    := cxDateEdit1.Text;
    report_date       := DateToStr(Date);

    humen_or_women    := 0;
    if cxCheckBox14.Checked  then humen_or_women   := 1;
    if cxCheckBox15.Checked  then humen_or_women   := 2;

    tip_sel := 0;
    //*** Параметры Построения запроса ***//
    if cxCheckBox5.Checked   then tip_sel := 1;
    if cxCheckBox6.Checked   then tip_sel := 1;
    if cxCheckBox7.Checked   then tip_sel := 1;
    if cxCheckBox8.Checked   then tip_sel := 1;
    if cxCheckBox9.Checked   then tip_sel := 1;

    if cxTextEdit1.Text<> '' then tip_sel := 1;
    if cxDateEdit2.Text<> '' then tip_sel := 1;
    if cxDateEdit3.Text<> '' then tip_sel := 1;
    if cxCheckBox12.Checked  then tip_sel := 1;
    if cxDateEdit1.Text<> '' then tip_sel := 1;

    if cxTextEdit1.Text = '' then
    begin
        id_depart      := 0;
        Dep_so_vkl     := 0;
    end;

    //*** Создаём запрос и формируем условия отбора ***//
    DataSet_SSD.close;
    DataSet_SSD.SQLs.SelectSQL.Text :='select * from ASUP_PEOPLE_PRINT_INFO('+IntToStr(Setings_FIO)+','+IntToStr(tip_sel)+','''+report_date+''','+IntToStr(work_or_not)+','+IntToStr(id_depart)+','+IntToStr(Dep_so_vkl)+')';
    //*** Параметры фильтрации ***//
    flag_look := false;
    if (DR_s <> '') and (DR_po <> '') then
    begin
        if flag_look = false then
        begin
            prefix := 'where ';
            DataSet_SSD.SelectSQL.Add(prefix +'(BIRTH_DATE between '+''''+DR_s+''''+ ' and '+''''+DR_po+''''+')');
            flag_look := true;
        end else
        begin
            prefix := 'and ';
            DataSet_SSD.SelectSQL.Add(prefix +'(BIRTH_DATE between '+''''+DR_s+''''+ ' and '+''''+DR_po+''''+')');
        end;
    end;
    if (work_in_date_s <> '') and (work_in_date_po <> '') then
    begin
        if flag_look = false then
        begin
            prefix := 'where ';
            DataSet_SSD.SelectSQL.Add(prefix +'(DATE_BEG between '+''''+work_in_date_s+''''+' AND '+''''+work_in_date_po+''''+
                                           ' OR REAL_DATE_END between '+''''+work_in_date_s+''''+' AND '+''''+work_in_date_po+''''+')');
            flag_look := true;
        end else
        begin
            prefix := 'and ';
            DataSet_SSD.SelectSQL.Add(prefix +'(DATE_BEG between '+''''+work_in_date_s+''''+' AND '+''''+work_in_date_po+''''+
                                           ' OR REAL_DATE_END between '+''''+work_in_date_s+''''+' AND '+''''+work_in_date_po+''''+')');
        end;
    end;
    if (what_work_date <> '') then
    begin
        if flag_look = false then
        begin
            prefix := 'where ';
            DataSet_SSD.SelectSQL.Add(prefix +'('+''''+what_work_date+''''+ ' between DATE_BEG AND REAL_DATE_END)');
        end else
        begin
            prefix := 'and ';
            DataSet_SSD.SelectSQL.Add(prefix +'('+''''+what_work_date+''''+ ' between DATE_BEG AND REAL_DATE_END)');
        end;
    end;
    if humen_or_women = 1 then
    begin
        if flag_look = false then
        begin
            prefix := 'where ';
            DataSet_SSD.SelectSQL.Add(prefix +'ID_SEX = '+IntToStr(humen_or_women));
        end else
        begin
            prefix := 'and ';
            DataSet_SSD.SelectSQL.Add(prefix +'ID_SEX = '+IntToStr(humen_or_women));
        end;
    end;
    if humen_or_women = 2 then
    begin
        if flag_look = false then
        begin
            prefix := 'where ';
            DataSet_SSD.SelectSQL.Add(prefix +'ID_SEX = '+IntToStr(humen_or_women));
        end else
        begin
            prefix := 'and ';
            DataSet_SSD.SelectSQL.Add(prefix +'ID_SEX = '+IntToStr(humen_or_women));
        end;
    end;

    DataSet_SSD.Open;
    {DataSet_SSD.Last;
    kill_this_param := DataSet_SSD.RecordCount;

    ShowMessage(IntToStr(kill_this_param));}

    {frVariables['ustanova']        := _ORG_FULL_NAME;}
    {frVariables['TN_BOOL']            := Setings_TN;

    frReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Reports\ASUP\' + 'ASUP_PEOPLE_PRIN_INFO.frf');

    frReport1.PrepareReport;
    frReport1.ShowReport;}

    frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Reports\ASUP\' + 'Asup_people_print_info.fr3');

    frxReportPrint.Variables['TN_BOOL']     := Setings_TN;
    frxReportPrint.Variables['DR_BOOL']     := Setings_DR;
    frxReportPrint.Variables['SX_BOOL']     := Setings_Sex;
    frxReportPrint.Variables['DP_BOOL']     := Setings_Dep;
    frxReportPrint.Variables['UC_BOOL']     := Setings_Place;
    frxReportPrint.Variables['PS_BOOL']     := Setings_Post;
    frxReportPrint.Variables['OT_BOOL']     := Setings_ZP;
    frxReportPrint.Variables['DW_BOOL']     := Setings_DW;

    frxReportPrint.PrepareReport;
    frxReportPrint.ShowReport;
end;

procedure TfminfoPEOPLE.cxDateEdit2Exit(Sender: TObject);
begin
    if (cxDateEdit2.Text <> '') and (cxDateEdit3.Text <> '') then
    begin
        if (cxDateEdit2.Text > cxDateEdit3.Text) then ShowMessage('Дата початку не може бути бiльшою за дату кiнця!');
    end;
end;

procedure TfminfoPEOPLE.cxDateEdit3Exit(Sender: TObject);
begin
    if (cxDateEdit2.Text <> '') and (cxDateEdit3.Text <> '') then
    begin
        if (cxDateEdit2.Text > cxDateEdit3.Text) then ShowMessage('Дата кiнця не може бути меньшою за дату початку!');
    end;
end;

procedure TfminfoPEOPLE.cxDateEdit4Exit(Sender: TObject);
begin
    if (cxDateEdit4.Text <> '') and (cxDateEdit5.Text <> '') then
    begin
        if (cxDateEdit5.Text > cxDateEdit4.Text) then ShowMessage('Дата кiнця не може бути меньшою за дату початку!');
    end;
end;

procedure TfminfoPEOPLE.cxDateEdit5Exit(Sender: TObject);
begin
    if (cxDateEdit4.Text <> '') and (cxDateEdit5.Text <> '') then
    begin
        if (cxDateEdit5.Text > cxDateEdit4.Text) then ShowMessage('Дата початку не може бути бiльшою за дату кiнця!');
    end;
end;

procedure TfminfoPEOPLE.Action1Execute(Sender: TObject);
var
    sp: TSprav;
begin
    if ((cxTextEdit1.IsFocused) or (cxButton4.Focused)) then
    begin
        // создать справочник
        sp :=  GetSprav('SpDepartment');
        if sp <> nil then
        begin
                // заполнить входные параметры
            with sp.Input do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(DBTransfer.Handle);
                FieldValues['Actual_Date'] := Date;
                Post;
            end;

                    // показать справочник и проанализировать результат (выбор одного подр.)
            sp.Show;
            if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
            begin
                id_depart        := sp.Output['Id_Department'];
                cxTextEdit1.Text := sp.Output['Name_Full'];
            end;
            sp.Free;
        end;
    end;
end;

procedure TfminfoPEOPLE.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

end.
