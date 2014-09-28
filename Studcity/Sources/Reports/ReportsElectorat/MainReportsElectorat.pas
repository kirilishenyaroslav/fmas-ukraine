unit MainReportsElectorat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons,IBase, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, frxDesgn, frxClass, frxDBSet,
  frxExportXLS, ComCtrls, ActnList, RxMemDS, DBCtrls, ExtCtrls, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxCheckBox;

type
  TfrmMainElectorat = class(TForm)
    cxButton1: TcxButton;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    pFIBDataSet1: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxXLSExport1: TfrxXLSExport;
    ActionList1: TActionList;
    ActionDesigned: TAction;
    StatusBar: TStatusBar;
    RxMemoryData1: TRxMemoryData;
    DataSource1: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    RadioGroup1: TRadioGroup;
    cxDateEdit1: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    frxDBDatasetMaster: TfrxDBDataset;
    frxDBDatasetDetails: TfrxDBDataset;
    pFIBDataSetMaster: TpFIBDataSet;
    pFIBDataSetDetails: TpFIBDataSet;
    DataSourceMaster: TDataSource;
    cxLabel3: TcxLabel;
    cxDateEdit2: TcxDateEdit;
    cxCheckBoxViewRoom: TcxCheckBox;
    frxReport1: TfrxReport;
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionDesignedExecute(Sender: TObject);
    procedure RxMemoryData1AfterScroll(DataSet: TDataSet);
    procedure DBLookupComboBox1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE);overload;
  end;

function ReportsElectoratDPK(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
exports ReportsElectoratDPK;

var
  designer_rep:Integer;

implementation

{$R *.dfm}

uses WaitForm_electorat;

function ReportsElectoratDPK(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  rep:TfrmMainElectorat;
begin
  rep:=TfrmMainElectorat.Create(AOwner,DB);
  
end;

constructor TfrmMainElectorat.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
begin
  Inherited Create(AOwner);
  pFIBDatabase1.Handle:=DB;
  designer_rep:=0;

  RxMemoryData1.Open;
  RxMemoryData1.Insert;
  RxMemoryData1.FieldByName('RxID').AsVariant:=11;
  RxMemoryData1.FieldByName('RxNAME').AsString:='Список для выборов(список електората с пасп. дан.)';
  RxMemoryData1.FieldByName('RxTYPE').AsVariant:=3;
  RxMemoryData1.Post;

  RxMemoryData1.Open;
  RxMemoryData1.Insert;
  RxMemoryData1.FieldByName('RxID').AsVariant:=1;
  RxMemoryData1.FieldByName('RxNAME').AsString:='Список для выборов(список електората)';
  RxMemoryData1.FieldByName('RxTYPE').AsVariant:=3;
  RxMemoryData1.Post;

  RxMemoryData1.Open;
  RxMemoryData1.Insert;
  RxMemoryData1.FieldByName('RxID').AsVariant:=2;
  RxMemoryData1.FieldByName('RxNAME').AsString:='Список для выборов(на факультеты)';
  RxMemoryData1.FieldByName('RxTYPE').AsVariant:=1;
  RxMemoryData1.Post;

  RxMemoryData1.Insert;
  RxMemoryData1.FieldByName('RxID').AsVariant:=3;
  RxMemoryData1.FieldByName('RxNAME').AsString:='Список для выборов(прописанных после )';
  RxMemoryData1.FieldByName('RxTYPE').AsVariant:=3;
  RxMemoryData1.Post;

  RxMemoryData1.Insert;
  RxMemoryData1.FieldByName('RxID').AsVariant:=4;
  RxMemoryData1.FieldByName('RxNAME').AsString:='Список для выборов(выписаных после )';
  RxMemoryData1.FieldByName('RxTYPE').AsVariant:=3;
  RxMemoryData1.Post;

  RxMemoryData1.Open;
  RxMemoryData1.Insert;
  RxMemoryData1.FieldByName('RxID').AsVariant:=5;
  RxMemoryData1.FieldByName('RxNAME').AsString:='Список для выборов(Кому исполнилось 18 лет)';
  RxMemoryData1.FieldByName('RxTYPE').AsVariant:=3;
  RxMemoryData1.Post;

  RxMemoryData1.Open;
  RxMemoryData1.Insert;
  RxMemoryData1.FieldByName('RxID').AsVariant:=6;
  RxMemoryData1.FieldByName('RxNAME').AsString:='Список для выборов(Изменившие фамилию)';
  RxMemoryData1.FieldByName('RxTYPE').AsVariant:=3;
  RxMemoryData1.Post;

  RxMemoryData1.Open;
  RxMemoryData1.Insert;
  RxMemoryData1.FieldByName('RxID').AsVariant:=7;
  RxMemoryData1.FieldByName('RxNAME').AsString:='Список прописанных, но не продливших прописку';
  RxMemoryData1.FieldByName('RxTYPE').AsVariant:=3;
  RxMemoryData1.Post;

  RxMemoryData1.Open;
  RxMemoryData1.Insert;
  RxMemoryData1.FieldByName('RxID').AsVariant:=8;
  RxMemoryData1.FieldByName('RxNAME').AsString:='Список прописанных с удостоверениями, зарегистрированнее за период';
  RxMemoryData1.FieldByName('RxTYPE').AsVariant:=3;
  RxMemoryData1.Post;

  RxMemoryData1.Open;
  RxMemoryData1.Insert;
  RxMemoryData1.FieldByName('RxID').AsVariant:=9;
  RxMemoryData1.FieldByName('RxNAME').AsString:='Список прописанных фамилии рус и укр';
  RxMemoryData1.FieldByName('RxTYPE').AsVariant:=3;
  RxMemoryData1.Post;

  RxMemoryData1.Open;
  RxMemoryData1.Insert;
  RxMemoryData1.FieldByName('RxID').AsVariant:=10;
  RxMemoryData1.FieldByName('RxNAME').AsString:='Принудительный список электората';
  RxMemoryData1.FieldByName('RxTYPE').AsVariant:=3;
  RxMemoryData1.Post;

  RadioGroup1.ItemIndex:=0;
  cxDateEdit2.Date:=Date;
  cxDateEdit1.Date:=Date;
end;


procedure TfrmMainElectorat.cxButton1Click(Sender: TObject);
var
  ViewRoom:String;
begin
  SQL_Wait_Form:= TSQL_Wait_Form.Create(Self);
  SQL_Wait_Form.Show;
  SQL_Wait_Form.Update;

  if cxDateEdit2.Text='' then cxDateEdit2.Date:=Date;
  if cxDateEdit1.Text='' then cxDateEdit1.Date:=Date;
  pFIBDataSet1.Close;
  if (RxMemoryData1.FieldByName('RxID').AsVariant=1) then
    begin
      pFIBDataSet1.Close;
      pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from ST_PRINT_LIST_ELEKTORAT(:param_type,:param_date,:param_date_rog) PLE order by PLE.id_builds, PLE.fam_rus, PLE.imya_rus, PLE.otch_rus';
      pFIBDataSet1.ParamByName('param_type').AsInteger:=RxMemoryData1.FieldByName('RxID').AsVariant;
      pFIBDataSet1.ParamByName('param_date_rog').AsDate:=cxDateEdit2.Date;
      pFIBDataSet1.ParamByName('param_date').AsDate:=cxDateEdit1.Date;
      pFIBDataSet1.Open;

      if RadioGroup1.ItemIndex=0 then
        begin
          frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListElectorat_A4'+'.fr3');
        end
        else
        begin
          frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListElectorat_A3'+'.fr3');
        end;

      frxReport1.Variables.Clear;

      if cxCheckBoxViewRoom.Checked=true then
        begin
          ViewRoom:='1';
          frxReport1.Variables['ViewRoom']:=''''+ViewRoom+'''';;
        end
        else
        begin
          ViewRoom:='0';
          frxReport1.Variables['ViewRoom']:=''''+ViewRoom+'''';;
        end;
      end;

  if (RxMemoryData1.FieldByName('RxID').AsVariant=11) then
    begin
      pFIBDataSet1.Close;
      pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from ST_PRINT_LIST_ELEKTORAT(:param_type,:param_date,:param_date_rog) PLE order by PLE.id_builds, PLE.fam_rus, PLE.imya_rus, PLE.otch_rus';
      pFIBDataSet1.ParamByName('param_type').AsInteger:=1;
      pFIBDataSet1.ParamByName('param_date_rog').AsDate:=cxDateEdit2.Date;
      pFIBDataSet1.ParamByName('param_date').AsDate:=cxDateEdit1.Date;
      pFIBDataSet1.Open;

      if RadioGroup1.ItemIndex=0 then
        begin
          frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListElectorat_pasp_A4'+'.fr3');
        end
        else
        begin
          frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListElectorat_pasp_A3'+'.fr3');
        end;

      frxReport1.Variables.Clear;

      if cxCheckBoxViewRoom.Checked=true then
        begin
          ViewRoom:='1';
          frxReport1.Variables['ViewRoom']:=''''+ViewRoom+'''';;
        end
        else
        begin
          ViewRoom:='0';
          frxReport1.Variables['ViewRoom']:=''''+ViewRoom+'''';;
        end;
      end;

  if RxMemoryData1.FieldByName('RxID').AsVariant=2 then
    begin
      pFIBDataSet1.Close;
      pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from ST_PRINT_LIST_ELEKTORAT(:param_type,:param_date,:param_date_rog) PLE order by PLE.Name_fak, PLE.id_builds, PLE.fam_rus, PLE.imya_rus, PLE.otch_rus';
      pFIBDataSet1.ParamByName('param_type').AsInteger:=RxMemoryData1.FieldByName('RxID').AsVariant;
      pFIBDataSet1.ParamByName('param_date').AsDate:=cxDateEdit1.Date;
      pFIBDataSet1.ParamByName('param_date_rog').AsDate:=cxDateEdit2.Date;
      pFIBDataSet1.Open;

      frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListElectorat_FAKULT'+'.fr3');

      end;

  if (RxMemoryData1.FieldByName('RxID').AsVariant=3) then
    begin
      pFIBDataSet1.Close;
      pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from ST_PRINT_LIST_ELEKTORAT(:param_type,:param_date,:param_date_rog) PLE order by PLE.id_builds, PLE.fam_rus, PLE.imya_rus, PLE.otch_rus';
      pFIBDataSet1.ParamByName('param_type').AsInteger:=RxMemoryData1.FieldByName('RxID').AsVariant;
      pFIBDataSet1.ParamByName('param_date').AsDate:=cxDateEdit1.Date;
      pFIBDataSet1.ParamByName('param_date_rog').AsDate:=cxDateEdit2.Date;
      pFIBDataSet1.Open;

      if RadioGroup1.ItemIndex=0 then
        begin
          frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListElectoratOnDate_A4'+'.fr3');
        end
        else
        begin
          frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListElectoratOnDate_A3'+'.fr3');
        end;
      end;

  if (RxMemoryData1.FieldByName('RxID').AsVariant=4) then
    begin
      pFIBDataSet1.Close;
      pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from ST_PRINT_LIST_ELEKTORAT(:param_type,:param_date,:param_date_rog) PLE order by PLE.id_builds, PLE.fam_rus, PLE.imya_rus, PLE.otch_rus';
      pFIBDataSet1.ParamByName('param_type').AsInteger:=RxMemoryData1.FieldByName('RxID').AsVariant;
      pFIBDataSet1.ParamByName('param_date').AsDate:=cxDateEdit1.Date;
      pFIBDataSet1.ParamByName('param_date_rog').AsDate:=cxDateEdit2.Date;
      pFIBDataSet1.Open;

      if RadioGroup1.ItemIndex=0 then
        begin
          frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListElectoratOnDateVIP_A4'+'.fr3');
        end
        else
        begin
          frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListElectoratOnDateVIP_A3'+'.fr3');
        end;
      end;

  if (RxMemoryData1.FieldByName('RxID').AsVariant=5) then
    begin
      pFIBDataSet1.Close;
      pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from ST_PRINT_LIST_ELEKTORAT(:param_type,:param_date,:param_date_rog) PLE order by PLE.id_builds, PLE.fam_rus, PLE.imya_rus, PLE.otch_rus';
      pFIBDataSet1.ParamByName('param_type').AsInteger:=RxMemoryData1.FieldByName('RxID').AsVariant;
      pFIBDataSet1.ParamByName('param_date_rog').AsDate:=cxDateEdit1.Date;
      pFIBDataSet1.ParamByName('param_date').AsDate:=cxDateEdit2.Date;
      pFIBDataSet1.Open;

      if RadioGroup1.ItemIndex=0 then
        begin
          frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListElectorat_A4'+'.fr3');
        end
        else
        begin
          frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListElectorat_A3'+'.fr3');
        end;
      end;

  if (RxMemoryData1.FieldByName('RxID').AsVariant=6) then
    begin
      pFIBDataSet1.Close;
      pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from ST_PRINT_LIST_ELEKTORAT(:param_type,:param_date,:param_date_rog) PLE order by PLE.id_builds, PLE.fam_rus, PLE.imya_rus, PLE.otch_rus';
      pFIBDataSet1.ParamByName('param_type').AsInteger:=RxMemoryData1.FieldByName('RxID').AsVariant;
      pFIBDataSet1.ParamByName('param_date_rog').AsDate:=cxDateEdit2.Date;
      pFIBDataSet1.ParamByName('param_date').AsDate:=cxDateEdit1.Date;
      pFIBDataSet1.Open;
      frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListElectorat_ChangeFIO'+'.fr3');
    end;

  if (RxMemoryData1.FieldByName('RxID').AsVariant=7) then
    begin
      pFIBDataSet1.Close;
      pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from ST_PRINT_LIST_ELEKTORAT(:param_type,:param_date,:param_date_rog) PLE order by PLE.id_builds, PLE.fam_rus, PLE.imya_rus, PLE.otch_rus';
      pFIBDataSet1.ParamByName('param_type').AsInteger:=RxMemoryData1.FieldByName('RxID').AsVariant;
      pFIBDataSet1.ParamByName('param_date').AsDate:=cxDateEdit2.Date;
      pFIBDataSet1.Open;

      if RadioGroup1.ItemIndex=0 then
        begin
          frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListElectorat_A4'+'.fr3');
        end
        else
        begin
          frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListElectorat_A3'+'.fr3');
        end;
      end;
  if (RxMemoryData1.FieldByName('RxID').AsVariant=8) then
    begin
      pFIBDataSet1.Close;
      pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from ST_PRINT_LIST_ELEKTORAT(:param_type,:param_date,:param_date_rog) PLE order by PLE.id_builds, PLE.fam_rus, PLE.imya_rus, PLE.otch_rus';
      pFIBDataSet1.ParamByName('param_type').AsInteger:=RxMemoryData1.FieldByName('RxID').AsVariant;
      pFIBDataSet1.ParamByName('param_date_rog').AsDate:=cxDateEdit2.Date;
      pFIBDataSet1.ParamByName('param_date').AsDate:=cxDateEdit1.Date;
      pFIBDataSet1.Open;

      if RadioGroup1.ItemIndex=0 then
        begin
          frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListElectorat_A4'+'.fr3');
        end
        else
        begin
          frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListElectorat_A3'+'.fr3');
        end;
      end;

  if (RxMemoryData1.FieldByName('RxID').AsVariant=9) then
    begin
      pFIBDataSet1.Close;
      pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from ST_PRINT_LIST_ELEKTORAT(:param_type,:param_date,:param_date_rog) PLE order by PLE.id_builds, PLE.fam_rus, PLE.imya_rus, PLE.otch_rus';
      pFIBDataSet1.ParamByName('param_type').AsInteger:=RxMemoryData1.FieldByName('RxID').AsVariant;
      pFIBDataSet1.ParamByName('param_date_rog').AsDate:=cxDateEdit2.Date;
      pFIBDataSet1.ParamByName('param_date').AsDate:=cxDateEdit1.Date;
      pFIBDataSet1.Open;

      frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListFAM'+'.fr3');

      end;

  if (RxMemoryData1.FieldByName('RxID').AsVariant=10) then
    begin
      pFIBDataSet1.Close;
      pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from ST_PRINT_LIST_ELEKTORAT(:param_type,:param_date,:param_date_rog) PLE order by PLE.id_builds, PLE.fam_rus, PLE.imya_rus, PLE.otch_rus';
      pFIBDataSet1.ParamByName('param_type').AsInteger:=RxMemoryData1.FieldByName('RxID').AsVariant;
      pFIBDataSet1.ParamByName('param_date_rog').AsString:='01.01.1900';
      pFIBDataSet1.ParamByName('param_date').AsString:='01.01.1900';
      pFIBDataSet1.Open;

      if RadioGroup1.ItemIndex=0 then
        begin
          frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListElectorat_PR_A4'+'.fr3');
        end
        else
        begin
          frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ListElectorat_PR_A3'+'.fr3');
        end;

      frxReport1.Variables.Clear;

      if cxCheckBoxViewRoom.Checked=true then
        begin
          ViewRoom:='1';
          frxReport1.Variables['ViewRoom']:=''''+ViewRoom+'''';;
        end
        else
        begin
          ViewRoom:='0';
          frxReport1.Variables['ViewRoom']:=''''+ViewRoom+'''';;
        end;
      end;

  SQL_Wait_Form.BringToFront;
  SQL_Wait_Form.Update;

  if designer_rep=0 then
    begin
      frxReport1.PrepareReport(true);
      frxReport1.ShowReport;
    end
    else
    begin
      frxReport1.DesignReport;
    end;
end;

procedure TfrmMainElectorat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
end;


procedure TfrmMainElectorat.ActionDesignedExecute(Sender: TObject);
begin
if designer_rep=0 then
  begin
    designer_rep:=1;
    StatusBar.Panels[1].Text:='Режим отладки отчетов';
  end
  else
  begin
    designer_rep:=0;
    StatusBar.Panels[1].Text:='';
  end;
end;

procedure TfrmMainElectorat.RxMemoryData1AfterScroll(DataSet: TDataSet);
begin
{if RxMemoryData1.FieldByName('RxID').AsVariant=0 then
  begin
//
  end;
if RxMemoryData1.FieldByName('RxID').AsVariant=2 then
  begin
//
  end;
if RxMemoryData1.FieldByName('RxID').AsVariant=3 then
  begin

  end;}
end;

procedure TfrmMainElectorat.DBLookupComboBox1Exit(Sender: TObject);
begin
  case RxMemoryData1.FieldByName('RxID').AsVariant of
   1:
       begin
        cxLabel3.Caption:='Дата на которую должно испониться 18 лет';
        cxLabel2.Caption:='Дата выборов';
        cxLabel2.Visible:=true;
        cxDateEdit1.Visible:=True;
        cxDateEdit2.Visible:=True;
        cxCheckBoxViewRoom.Visible:=True;
       end;
    3:
       begin
        cxLabel3.Caption:='Дата на которую должно испониться 18 лет';
        cxLabel2.Caption:='Прописанные после';
        cxLabel2.Visible:=true;
        cxDateEdit1.Visible:=true;
        cxCheckBoxViewRoom.Visible:=false;
       end;
    4:
       begin
        cxLabel3.Caption:='Дата на которую должно испониться 18 лет';
        cxLabel2.Caption:='Выписанные после';
        cxLabel2.Visible:=true;
        cxDateEdit1.Visible:=true;
        cxCheckBoxViewRoom.Visible:=false;
       end;
    5:
      begin
        cxLabel3.Caption:='Начало периода';
        cxLabel2.Caption:='Конец периода';
        cxLabel2.Visible:=true;
        cxDateEdit1.Visible:=true;
        cxCheckBoxViewRoom.Visible:=false;
      end;
    6:
      begin
        cxLabel3.Caption:='Начало периода';
        cxLabel2.Caption:='Конец периода';
        cxLabel2.Visible:=true;
        cxDateEdit1.Visible:=true;
        cxCheckBoxViewRoom.Visible:=false;
      end;
    7:
      begin
        cxLabel3.Caption:='Дата на которую нет прописки';
        cxLabel2.Visible:=false;
        cxDateEdit1.Visible:=False;
        cxCheckBoxViewRoom.Visible:=false;
      end;
    8:
      begin
        cxLabel3.Caption:='Начало периода';
        cxLabel2.Caption:='Конец периода';
        cxLabel2.Visible:=true;
        cxDateEdit1.Visible:=true;
        cxCheckBoxViewRoom.Visible:=false;
      end;
    9:
      begin
        cxLabel3.Caption:='Дата на которую должно испониться 18 лет';
        cxLabel2.Caption:='Дата прописки';
        cxLabel2.Visible:=true;
        cxDateEdit1.Visible:=true;
        cxCheckBoxViewRoom.Visible:=false;
      end;
    10:
      begin
        cxLabel3.Caption:='Дата на которую должно испониться 18 лет';
        cxLabel2.Caption:='Дата прописки';
        cxLabel2.Visible:=False;
        cxLabel3.Visible:=False;
        cxDateEdit1.Visible:=False;
        cxDateEdit2.Visible:=False;
        cxCheckBoxViewRoom.Visible:=True;
      end;
    11:
       begin
        cxLabel3.Caption:='Дата на которую должно испониться 18 лет';
        cxLabel2.Caption:='Дата выборов';
        cxLabel2.Visible:=True;
        cxDateEdit1.Visible:=True;
        cxDateEdit2.Visible:=True;
        cxCheckBoxViewRoom.Visible:=True;
       end;
   else
     begin
      cxLabel3.Caption:='Дата на которую должно испониться 18 лет';
      cxLabel2.Caption:='Дата выборов';
      cxLabel2.Visible:=True;
      cxDateEdit1.Visible:=True;
      cxCheckBoxViewRoom.Visible:=False;
     end;
   end;
end;


end.
