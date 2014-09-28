unit uImportProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPC, cxControls, FIBDatabase, pFIBDatabase, uImportSourceSel,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, ExtCtrls, ActnList, cxGridTableView,
  RxMemDS, ImgList, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDataSet,
  pFIBDataSet, ComCtrls, ToolWin, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Gauges, StdCtrls,
  Buttons, cxContainer, cxMemo, Halcn6db, Mask, ToolEdit, dateUtils, uMainOplata;

type
  TfrmImportProgress = class(TForm)
    StatusBarSourceImport: TStatusBar;
    PageControl1: TPageControl;
    TabSheetLog: TTabSheet;
    MemoLog: TcxMemo;
    GroupBox1: TGroupBox;
    BitBtnStart: TBitBtn;
    BitBtnStop: TBitBtn;
    GroupBox4: TGroupBox;
    ProgressBar: TGauge;
    ButtonError: TButton;
    Panel1: TPanel;
    TabSheetEr: TTabSheet;
    ReadTransaction: TpFIBTransaction;
    DataSetSelRecord: TpFIBDataSet;
    DataSetImport: TpFIBDataSet;
    StorProc: TpFIBStoredProc;
    TransactionDel: TpFIBTransaction;
    ImageList1: TImageList;
    StyleRepository: TcxStyleRepository;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    ActionList1: TActionList;
    ActionStart: TAction;
    Timer1: TTimer;
    HTable: THalcyonDataSet;
    FilenameEdit: TFilenameEdit;
    ActionStop: TAction;
    DataSetSelPack: TpFIBDataSet;
    DataSetSelNumb: TpFIBDataSet;
    StoredProcDel: TpFIBStoredProc;
    DataBase: TpFIBDatabase;
    procedure ActionStartExecute(Sender: TObject);
    procedure FilenameEditExit(Sender: TObject);
    procedure FilenameEditAfterDialog(Sender: TObject; var Name: String;
      var Action: Boolean);
    procedure ActionStopExecute(Sender: TObject);
  private
    procname   : string;
    id_doc_ini  : integer;
    name_source : string;
    type_doc    : smallint;
    name_path   : string;
    pos         : Integer;
    myform      : TfrmMainOplata;
    textLog     : String;
    TFields     : array of string;
    TFieldsSP   : array of string;
    dir_name_file  : string;
    name_file   :  string;
    id_dt_pack  :  int64;
    procedure UpdateBar;
    procedure UpdateLog;
  public
    { Public declarations }
  end;
  function ShowImportProgress(dbase : TpFIBDatabase;id_doc_ini_in : integer;name_source_in : string;type_doc_in:integer;name_path_in, proc_name_in :string; var id_dt_pack_out: int64):boolean;


{var
  frmImportProgress: TfrmImportProgress; }

implementation

{$R *.dfm}

function ShowImportProgress(dbase : TpFIBDatabase;id_doc_ini_In : integer;name_source_in : string;type_doc_in:integer;name_path_in, proc_name_in :string; var id_dt_pack_out: int64):boolean;
var
    T : TfrmImportProgress;
begin
    T := TfrmImportProgress.Create(nil);
    T.DataBase  := dbase;

    T.ReadTransaction.DefaultDatabase             := T.DataBase;
    T.DataBase.DefaultTransaction                 := T.ReadTransaction;

    T.DataSetSelRecord.Database                   := T.DataBase;
    T.DataSetSelRecord.Transaction                := T.ReadTransaction;

    T.DataSetImport.Database                      := T.DataBase;
    T.DataSetImport.Transaction                   := T.ReadTransaction;

    T.DataSetSelPack .Database                    := T.DataBase;
    T.DataSetSelPack.Transaction                  := T.ReadTransaction;

    T.DataSetSelNumb .Database                    := T.DataBase;
    T.DataSetSelNumb.Transaction                  := T.ReadTransaction;

    T.TransactionDel.DefaultDatabase              := T.DataBase;

    T.StorProc.DataBase                           := T.DataBase;
    T.StorProc.Transaction                        := T.ReadTransaction;


    T.id_doc_ini           := id_doc_ini_in;
    T.name_source          := name_source_in;
    T.type_doc             := type_doc_in;
    T.name_path            := name_path_in;
    T.ProcName             := proc_name_in;



    if T.ShowModal=mrOk then
    begin
        id_dt_pack_out := T.Id_dt_pack;

        Result := true;
    end  else
        Result := false;

    T.DataSetSelRecord.Close;
    T.DataSetImport.Close;
    T.DataSetSelPack.Close;
    T.Free
end;

{constructor TfrmImportProgress.Create(AOwner:TComponent; LocDB:TpFIBDatabase; frm:TfrmMainOplata);
begin
    inherited Create(AOwner);
    DataBase     :=LocDB;
    myform       :=frm;

    id_doc_ini           := myform.id_doc_ini;
    name_source          := myform.name_source;
    type_doc             := myform.type_doc;
    name_path            := myform.name_path;
    Caption:='';

    ReadTransaction.DefaultDatabase             := DataBase;
    DataBase.DefaultTransaction                 := ReadTransaction;
    DataSetSelRecord.Database                   := DataBase;
    DataSetSelRecord.Transaction                := ReadTransaction;
    DataSetImport.Database                      := DataBase;
    DataSetImport.Transaction                   := ReadTransaction;
    DataSetSelPack .Database                    := DataBase;
    DataSetSelPack.Transaction                  := ReadTransaction;
    DataSetSelNumb .Database                    := DataBase;
    DataSetSelNumb.Transaction                  := ReadTransaction;

    TransactionDel.DefaultDatabase              := DataBase;

    StorProc.DataBase                           := DataBase;
    StorProc.Transaction                        := ReadTransaction;


    StatusBarSourceImport.SimpleText :=name_source;

    BitBtnStart.Enabled:=false;
    Image2.Visible :=false;
end; }

procedure TfrmImportProgress.ActionStartExecute(Sender: TObject);
var
    PathDBF:string;
    i,n, pcount,pcount_temp, j, rcount:integer;
    count_records : integer;
    sum_pay, sum_tmp : double;
    numb_pack_new, numb_pack : int64;
    error_message : string;
begin
    if dir_name_file='' then
    begin
        exit;
    end;

    Timer1.Enabled:=true;

    Panel1.Visible :=false;
    Memolog.Lines.Clear;
    textLog:=DateTimeToStr(Now);
    UpdateLog;


    DataSetSelRecord.Close;
    DataSetSelRecord.SQLs.SelectSQL.Add('select * from BS_IMPORT_DOC_INI_PARAM BS_P,BS_IMPORT_DOC_INI BS_I where BS_I.id_doc_ini='''+VarToStr(id_doc_ini)+''' and BS_P.id_doc_ini=BS_I.id_doc_ini');
    DataSetSelRecord.Open;
    DataSetSelRecord.FetchAll;

    PathDBF         := dir_name_file;
    name_file       := ExtractFileName(dir_name_file);
    textLog         :='Файл даних '+PathDBF;
    UpdateLog;
    HTable.TableName:=PathDBF;

    textLog:='Процедура обробки '+ProcName;
    UpdateLog;
    try
        //Database.Connected      :=true;
        ReadTransaction.StartTransaction;
        StorProc.StoredProcName :=ProcName;
        StorProc.Prepare;
    except
        begin
            textLog:='Данної процедури не існує в базі данних';
            UpdateLog;
        end;
    end;

    try
        HTable.Active:=true;
        HTable.Edit;
    except
        begin
            textLog:='Файл заблокован іншим користувачем, або не існує.';
            HTable.Active:=false;
        end;
    end;

    if HTable.RecordCount=0 then
    begin
        textLog:='dbf Файл пустий';
        UpdateLog;
    end else
    begin
        textLog:='Кількість записів:';
        textLog:=IntToStr(HTable.RecordCount);
        UpdateLog;
    end;

    pcount:=DataSetSelRecord.RecordCount;
    rcount:=HTable.RecordCount;
    SetLength(TFields,pcount);
    SetLength(TFieldsSP,pcount);
    DataSetSelRecord.First;
    pcount_temp:=0;

    for i:=0 to pcount-1 do
    begin
        if (DataSetSelRecord.FieldByName('NAME_FILE_PARAM').AsString<>'Ігнорувати поле') then
        begin
            TFields[pcount_temp]   := DataSetSelRecord.FieldByName('NAME_FILE_PARAM').AsString;
            TFieldsSP[pcount_temp] := DataSetSelRecord.FieldByName('NAME_SP_PARAM').AsString;
            inc(pcount_temp);
        end;
        DataSetSelRecord.Next;
    end;
    pcount:=pcount_temp;

    try
        for i:=1 to pcount do
        begin
             HTable.FieldValues[TFields[i-1]];
        end;
    except
        begin
            textLog:='не вірна структура файлу';
            UpdateLog;
            //Exit;
        end;
    end;

    //начали экспорт данных
    textLog:='Початок экспорта данних '+DateToStr(Now);
    UpdateLog;
    BitBtnStart.Enabled := false;
    BitBtnStop.Enabled := true;
    HTable.First;
    ProgressBar.MaxValue    :=RCount;

    ReadTransaction.StartTransaction;
    id_dt_pack := database.gen_id('GEN_BS_ID_DT_PACK',1);
    DataSetSelNumb.Close;
    DataSetSelNumb.SQLs.SelectSQL.Text := 'select max(numb_pack) as numb_pack from bs_dt_pack';
    DataSetSelNumb.Open;
    try numb_pack := DataSetSelNumb.FBN('numb_pack').AsInteger; except numb_pack:= 0 end;
    numb_pack_new := numb_pack+1;
    sum_pay := 0;


    for j:=1 to rcount do
    begin
       for i:=1 to pcount do
       begin
           if (TFieldsSP[i-1]='IN_SUM_PAY') then
           begin
                    sum_tmp := HTable.FieldValues[TFields[i-1]];
                    sum_pay := sum_pay+sum_tmp;
                    HTable.Next;
           end;
       end;
    end;



    StorProc.StoredProcName := 'BS_DT_PACK_INS';
    StorProc.Prepare;
    StorProc.ParamByName('ID_DT_PACK').AsInt64            := id_dt_pack;
    StorProc.ParamByName('NAME_FILE_IMPORT').AsString     := name_file;
    StorProc.ParamByName('DATE_CURRENT').AsDate           := date;
    StorProc.ParamByName('ALL_COUNT_REC_PACK').AsInteger  := rcount;
    StorProc.ParamByName('all_sum_opl_pack').AsFloat      := sum_pay;
    StorProc.ParamByName('NUMB_PACK').AsInt64             := numb_pack_new;
    StorProc.ParamByName('ADD_BY_HAND').AsInteger         := 0;
    StorProc.ParamByName('MONTH_IN').AsVariant            := null;
    StorProc.ParamByName('YEAR_IN').AsVariant             := null;
    StorProc.ParamByName('ID_DOC_PROP').AsInteger         := type_doc;
    StorProc.ExecProc;



    StorProc.StoredProcName :=ProcName;
    StorProc.Prepare;
    HTable.First;
    for j:=1 to rcount do
    begin
         for i:=1 to pcount do
         begin
             if ((TFieldsSP[i-1]='IN_DATE_OPL') or (TFieldsSP[i-1]='IN_DATE_OBR')or (TFieldsSP[i-1]='IN_DATE_BEG') or (TFieldsSP[i-1]='IN_DATE_END'))then
             begin
                 StorProc.ParamByName(TFieldsSP[i-1]).AsDate := VarToDateTime(HTable.FieldValues[TFields[i-1]]);

             end else
             if ((TFieldsSP[i-1]='IN_SUM_PAY') or (TFieldsSP[i-1]='IN_DATA_VODOMER_LAST') or (TFieldsSP[i-1]='IN_DATA_VODOMER_ACT')) then
             begin
                  StorProc.ParamByName(TFieldsSP[i-1]).AsCurrency:=HTable.FieldValues[TFields[i-1]];
             end else
             begin
                 if Vartype(HTable.FieldValues[TFields[i-1]])=VarString then

                      StorProc.ParamByName(TFieldsSP[i-1]).Value:=HTable.FieldValues[TFields[i-1]]else
                      StorProc.ParamByName(TFieldsSP[i-1]).Value:=vartostr(HTable.FieldValues[TFields[i-1]]);
             end;

        end;
        StorProc.ParamByName('IN_ID_DOC_INI').AsInteger := id_doc_ini;
        StorProc.ParamByName('IN_ID_DT_PACK').AsInt64   := id_dt_pack;

        try
            begin
                StorProc.ExecProc;
            end;
        except
            begin
                TextLOG :='Помилка при виконанні процедури: ' + StorProc.StoredProcName + ' i = ' + IntToStr(j) + ' Особистий рахунок =' + StorProc.ParamByName('in_lc_acc').AsString;
                UpdateLog;
                StorProc.StoredProcName :='BS_DT_PACK_DEL';
                StorProc.Prepare;
                StorProc.ParamByName('IN_ID_DT_PACK').AsInt64   := id_dt_pack;
                try
                    begin
                        StorProc.ExecProc;
                        error_message                              := StorProc.ParamByName('error').value;
                        if (UpperCase(error_message)<>UpperCase('No')) then
                        begin
                            showmessage(error_message);
                            exit;
                        end;
                        ReadTransaction.Commit;
                    end;
                except
                    begin
                        ReadTransaction.Rollback;
                        TextLOG :='Неможливе видалення пачки';
                        UpdateLog;
                    end;
               end;
               Exit;
           end;
        end;
        pos := j;
        UpdateBar;
        HTable.Next;

    end;
    TextLOG:='Імпорт виконан успішно '+DateTimeToStr(Now);
    UpdateLog;
    HTable.Active:=false;
   // ReadTransaction.Commit;

    TextLOG:='Почали обробку даних: розподіл за особовими рахунками та за видами послуг';
    UpdateLog;

    DataSetSelPack.Close;
    DataSetSelPack.SQLs.SelectSQL.Add('select id_doc_buff from bs_import_doc_buff where id_doc_ini='+VarToStr(id_doc_ini)+' and id_dt_pack='+VarToStr(id_dt_pack));
    DataSetSelPack.Open;
    DataSetSelPack.FetchAll;

    count_records := DataSetSelPack.RecordCount;

    if DataSetSelPack.RecordCount=0 then
    begin
        TextLOG:='Немає даних для обробки';
        UpdateLog;
    end else
    begin
        TextLOG:='Даних для обробки у буфері';
        UpdateLog;
        TextLOG:=IntToStr(DataSetSelPack.RecordCount);
        UpdateLog;
        ProgressBar.MaxValue := DataSetSelPack.RecordCount;
        pos:=0;
        UpdateBar;


        StorProc.StoredProcName:='BS_ALLOCATION_ACC_AND_BAL_INS';
        //ReadTransaction.StartTransaction;
        StorProc.Prepare;
        DataSetSelPack.First;

        for i:=0 to DataSetSelPack.RecordCount-1 do
        begin
            StorProc.ParamByName('in_id_doc_buff').AsInt64 := TFibBCDField(DataSetSelPack.Fieldbyname('id_doc_buff')).asint64;
            DataSetSelPack.Next;
            pos:=i;
            UpdateBar;
            try
                StorProc.ExecProc;
            except
                begin
                    TextLOG:='Помилка при виконaннi процедури  '+DataSetSelPack.FieldByName('id_doc_buff').AsString;
                    UpdateLog;
                    StorProc.StoredProcName :='BS_DT_PACK_DEL';
                    StorProc.Prepare;
                    StorProc.ParamByName('IN_ID_DT_PACK').AsInt64   := id_dt_pack;
                    try
                        begin
                            StorProc.ExecProc;
                            error_message                              := StorProc.ParamByName('error').value;
                            if (UpperCase(error_message)<>UpperCase('No')) then
                            begin
                                showmessage(error_message);
                                exit;
                            end;
                            ReadTransaction.Commit;
                        end;
                    except
                        begin
                            ReadTransaction.Rollback;
                            TextLOG :='Неможливе видалення пачки';
                            UpdateLog;
                        end;
                    end;
                    Exit;
                end;
            end;
        end;
        pos:=i+1;
        UpdateBar;



        TextLOG:='Обрoбка закінчена '+DateTimeToStr(Now);
        UpdateLog;

        ReadTransaction.Commit;

     end;

    pos:=0;
    UpdateBar;
    ModalResult := mrOk;
end;

procedure TfrmImportProgress.UpdateLog;
begin
    Memolog.Lines.Add(textLog);
end;

procedure TfrmImportProgress.UpdateBar;
begin
    ProgressBar.Progress :=pos;
end;

procedure TfrmImportProgress.FilenameEditExit(Sender: TObject);
begin
    FilenameEdit.InitialDir     := name_path;
    dir_name_file               := FilenameEdit.FileName;
end;

procedure TfrmImportProgress.FilenameEditAfterDialog(Sender: TObject;
  var Name: String; var Action: Boolean);
begin
    BitBtnStart.Enabled     := true;
end;

procedure TfrmImportProgress.ActionStopExecute(Sender: TObject);
begin
    HTable.Active:=false;
    //ReadTransaction.RollBAck;
    pos:=0;
    UpdateBar;
end;

end.
