unit UMain_Import_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, shellapi, ExtCtrls, Halcn6Nv, DB, Halcn6db, UDialg_hunt,
  RusDlg, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc,
  cxLookAndFeelPainters, cxButtons, cxContainer, cxProgressBar, cxTextEdit,
  cxMemo, FIBDataSet, pFIBDataSet, Ibase;

type
  TfmImport = class(TForm)
    HalcDataSetSelect: THalcyonDataSet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    DataSource1: TDataSource;
    Database_CN: TpFIBDatabase;
    StoredProc_CN: TpFIBStoredProc;
    TransactionRead: TpFIBTransaction;
    TransactionWrite: TpFIBTransaction;
    Panel1: TPanel;
    cxButton1: TcxButton;
    Panel2: TPanel;
    cxButton2: TcxButton;
    Label_hint: TLabel;
    ProgressBar_one: TcxProgressBar;
    ProgressBar_all: TcxProgressBar;
    Label2: TLabel;
    Label3: TLabel;
    DataSet_CN_import: TpFIBDataSet;
    cxButton3: TcxButton;
    Label_chto_imp: TLabel;
    Label_kuda_imp: TLabel;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
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
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    cxTextEdit_loock: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //procedure insert_data;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
         name, name_test, name_path : String;
         Path_for_bat : PChar;
         spec_kons1, spec_kons2, spec_kons3, spec_kons4,  spec_kons5,  spec_kons6,  spec_kons7 : Integer;

         id_log : int64;
         name_last_archiva, where_put_archiv : string;
  public
       constructor Create(AOwner: TComponent; DataBase1: TISC_DB_HANDLE); reintroduce; overload;
  end;

  TConnect = class(TThread)
  public
    z, posAll, posOne, raz_opl, posOneMax  : integer;
    Lhint_txt, Lchto_txt, Lkuda_txt        : String;
    zamena_tmp, zamena_tmp_cast, zpt, zpt1 : string;
    FIO_RU_zpt, IMYA_RU_zpt, OTCHEST_RU_zpt, FIO_UK_zpt, IMYA_UK_zpt, OTCHEST_UK_zpt : string;
    put_arc_clon, name_clon                : string;

    ProgressBar_all, ProgressBar_one        : TcxProgressBar;
    DB                                      : TpFIBDatabase;
    TransWr,TransR                          : TpFIBTransaction;
    SProc                                   : TpFIBStoredProc;
    ButtonDir,ButtonImp,ButtonClose         : TcxButton;
    HSet                                    : THalcyonDataSet;
    Label_hints, Leb_chto_imp, Leb_kuda_imp : TLabel;
    TextEdit_look                           : TcxTextEdit;
    procedure insert_data;
    procedure UpdateBar;
    Constructor create(ProgAll,ProgOne             : TcxProgressBar;
                       DataB                       : TpFIBDataBase;
                       TR_read, tr_wright          : TpFIBTransaction;
                       SP                          : TpFIBStoredProc;
                       BSelDir,BClose,BImp         : TcxButton;
                       Lchto_imp, Lkuda_imp, Lhint : TLabel;
                       HSet_tr                     : THalcyonDataSet;
                       path_int_constr, name_cl    : String);
    procedure Execute;override;
    destructor Destroy;override;
  end;

var
  fmImport: TfmImport;

implementation

uses DateUtils;

{$R *.dfm}

Constructor TConnect.create(ProgAll,ProgOne             : TcxProgressBar;
                            DataB                       : TpFIBDataBase;
                            TR_read, tr_wright          : TpFIBTransaction;
                            SP                          : TpFIBStoredProc;
                            BSelDir,BClose,BImp         : TcxButton;
                            Lchto_imp, Lkuda_imp, Lhint : TLabel;
                            HSet_tr                     : THalcyonDataSet;
                            path_int_constr, name_cl    : String);
begin
    ProgressBar_all := ProgAll;
    ProgressBar_one := ProgOne;
    DB              := DataB;
    TransWr         := tr_wright;
    TransR          := TR_read;
    SProc           := SP;
    HSet            := HSet_tr;

    ButtonDir       := BSelDir;
    ButtonImp       := BImp;
    ButtonClose     := BClose;

    put_arc_clon    := path_int_constr;
    name_clon       := name_cl;

    Label_hints     := Lhint;
    Leb_chto_imp    := Lchto_imp;
    Leb_kuda_imp    := Lkuda_imp;

    ProgressBar_one.Position := 0;
    ProgressBar_all.Position := 0;
    z                   := 0;
    inherited Create(false);
end;

constructor TfmImport.Create(AOwner: TComponent; DataBase1: TISC_DB_HANDLE);
begin
    inherited Create (AOwner);
    Database_CN.Handle := DataBase1;
    TransactionRead.DefaultDatabase := Database_CN;
    Database_CN.Connected := true;
    DataSet_CN_import.Close;
    DataSet_CN_import.SQLs.SelectSQL.Text :='select * from CN_VC_SELECT_NAME_FROM_LOG';
    DataSet_CN_import.Open;

    name_last_archiva := DataSet_CN_import['D_ARHIV'];
    name_path         := DataSet_CN_import['PATH'];
    spec_kons1 := StrToInt(name_last_archiva[8])+1;
    spec_kons2 := StrToInt(name_last_archiva[7]);
    spec_kons3 := StrToInt(name_last_archiva[6]);
    spec_kons4 := StrToInt(name_last_archiva[5]);
    spec_kons5 := StrToInt(name_last_archiva[4]);
    spec_kons6 := StrToInt(name_last_archiva[3]);
    spec_kons7 := StrToInt(name_last_archiva[2]);
    if (spec_kons1 = 10) then
    begin
        spec_kons1 := 0;
        if (spec_kons2 = 9) then
        begin
            spec_kons2 := 0;
            if (spec_kons3 = 9) then
            begin
                spec_kons3 := 0;
                if (spec_kons4 = 9) then
                begin
                    spec_kons4 := 0;
                    if (spec_kons5 = 9) then
                    begin
                        spec_kons5 := 0;
                        if (spec_kons6 = 9) then
                        begin
                            spec_kons6 := 0; spec_kons7 := spec_kons7 + 1;
                        end else begin spec_kons6 := spec_kons6 + 1; end;
                    end else begin spec_kons5 := spec_kons5 + 1; end;
                end else begin spec_kons4 := spec_kons4 + 1; end;
            end else begin spec_kons3 := spec_kons3 + 1; end;
        end else begin spec_kons2 := spec_kons2 + 1; end;

    end;
    name_last_archiva := IntToStr(spec_kons7)+IntToStr(spec_kons6)+IntToStr(spec_kons5)+IntToStr(spec_kons4)+IntToStr(spec_kons3)+IntToStr(spec_kons2)+IntToStr(spec_kons1);

//    name_path := 'A:\';
    Label_chto_imp.Caption := 'Iмпортуеться: ' + 'D' + name_last_archiva + '.rar' + ' та '+ 'S' + name_last_archiva + '.rar';
    Label_kuda_imp.Caption := 'З каталога: ' + name_path;
end;


procedure TConnect.insert_data;
var
    ir : integer;
    long_pole : string;
    year1, year2: integer;
begin
    //****************************************************************************//
    //                                                                            //
    //                         Проверка и добавление в FireBird                   //
    //                                                                            //
    //****************************************************************************//
    Label_hints.Font.Color := clWindowText;
    posAll := 1;
    ButtonDir.Enabled := false;
    ButtonImp.Enabled := false;
    Synchronize(UpdateBar);

    DB.Connected := True;

    SProc.Database:=DB;
    SProc.Transaction:=TransWr;
    SProc.Transaction.StartTransaction;
    SProc.StoredProcName:='CN_VC_DEL_DOG_VC';
    SProc.Prepare;
    try
       SProc.ExecProc;
       TransWr.Commit;
    except on E:Exception do begin
       TransWr.Rollback;
       ShowMessage(E.Message);
    end end;

 //**********  Table Mova ********************

    HSet.Active := False;
    HSet.TableName := {ExtractFilePath(Application.ExeName)}put_arc_clon + '\' +'TempBufer\n_mova.dbf';
    HSet.Active := true;

    Label_hints.Caption := 'Iмпорт з таблицi n_mova.dbf';

    SProc.Database:=DB;
    SProc.Transaction:=TransWr;
    TransWr.StartTransaction;

    HSet.First;
    while not HSet.Eof do
    begin
      try
        posOne := posOne + 30;
        Synchronize(UpdateBar);

        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //TransWr.StartTransaction;
        SProc.StoredProcName:='CN_CHECKED_MOVA';
        SProc.Prepare;
        SProc.ParamByName('ID_MOVA').AsInt64      := HSet['MOVA'];
        SProc.ParamByName('name_mova').AsString   := HSet['NMOVA'];
        try
           SProc.ExecProc;
           //TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;

        //******* End Write  ***********************

      except on E : Exception
      do begin
          ShowMessage(E.Message);
          exit;
      end;
      end;
    HSet.Next;
    End;

    posAll := 5;
    Synchronize(UpdateBar);

    posOne := 0;
    Synchronize(UpdateBar);

    //**********  Table Mova ********************
    posOneMax :=390;
    Synchronize(UpdateBar);
    HSet.Active := False;
    HSet.TableName := {ExtractFilePath(Application.ExeName)}put_arc_clon + '\' +'TempBufer\n_banki.dbf';
    HSet.Active := true;

    Label_hints.Caption := 'Iмпорт з таблицi n_banki.dbf';

    HSet.First;
    while not HSet.Eof do
    begin
      try

        //cxMemo1.Lines.Add(HSet.FieldByName('NSB').Value + '  ' + HSet.FieldByName('MFO').Value);
        
        posOne := posOne + 1;
        Synchronize(UpdateBar);

        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //SProc.Transaction.StartTransaction;
        SProc.StoredProcName:='CN_CHECKED_BANK';
        SProc.Prepare;
        SProc.ParamByName('NAME_BANK').AsString   := HSet.FieldByName('NSB').AsString;
        SProc.ParamByName('SITY_BANK').AsString   := HSet.FieldByName('GSB').AsString;
        SProc.ParamByName('BANK_MFO').AsString    := HSet.FieldByName('MFO').AsString;
        try
           SProc.ExecProc;
         //  TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;

        //******* End Write  ***********************

      except on E : Exception
      do begin
          ShowMessage(E.Message);
          exit;
      end;
      end;
    HSet.Next;
    End;

    posAll := 10;
    Synchronize(UpdateBar);

    posOne := 0;
    Synchronize(UpdateBar);


    //**********  Table Mova ********************
    HSet.Active := False;
    HSet.TableName := {ExtractFilePath(Application.ExeName)}put_arc_clon + '\' +'TempBufer\n_stran.dbf';
    HSet.Active := true;

    Label_hints.Caption := 'Iмпорт з таблицi n_stran.dbf';

    HSet.First;
    while not HSet.Eof do
    begin
      try
        //cxMemo1.Lines.Add(HSet.FieldByName('NSTRAN').Value + '  ' + HSet.FieldByName('KSTRAN').Value);
        posOne := posOne + 1;
        Synchronize(UpdateBar);

        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //SProc.Transaction.StartTransaction;
        SProc.StoredProcName:='CN_CHECKED_STRANA';
        SProc.Prepare;
        SProc.ParamByName('K_STRAN').AsString     := HSet.FieldByName('KSTRAN').AsString;
        SProc.ParamByName('NAME_STRANI').AsString := HSet.FieldByName('NSTRAN').AsString;
        SProc.ParamByName('KLS').AsString         := HSet.FieldByName('KLS').AsString;
        SProc.ParamByName('NEKOR').AsString       := HSet.FieldByName('NEKOR').AsString;
        SProc.ParamByName('ID_STRANI').AsString   := HSet.FieldByName('KOD_GRAZHD').AsString;
        try
           SProc.ExecProc;
           //TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;

        //******* End Write  ***********************

      except on E : Exception
      do begin
          ShowMessage(E.Message);
          exit;
      end;
      end;
    HSet.Next;
    End;


    posAll := 15;
    Synchronize(UpdateBar);

    posOne := 0;
    Synchronize(UpdateBar);


    //**********  Table Mova ********************
    HSet.Active := False;
    HSet.TableName := {ExtractFilePath(Application.ExeName)}put_arc_clon + '\' +'TempBufer\n_kls.dbf';
    HSet.Active := true;

    Label_hints.Caption := 'Iмпорт з таблицi n_kls.dbf';

    HSet.First;
    while not HSet.Eof do
    begin
      try
        posOne := posOne + 1;
        Synchronize(UpdateBar);

        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //SProc.Transaction.StartTransaction;
        SProc.StoredProcName:='CN_CHECKED_KLS';
        SProc.Prepare;

        SProc.ParamByName('ID_KLS').AsString    := HSet.FieldByName('KLS').AsString;
        SProc.ParamByName('NAME_KLS').AsString  := HSet.FieldByName('NKLS').AsString;
        SProc.ParamByName('UKR_NKLS').AsString  := HSet.FieldByName('UKR_NKLS').AsString;
        try
           SProc.ExecProc;
           //TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;

        //******* End Write  ***********************

      except on E : Exception
      do begin
          ShowMessage(E.Message);
          exit;
      end;
      end;
    HSet.Next;
    End;


    posAll := 20;
    Synchronize(UpdateBar);

    posOne := 0;
    Synchronize(UpdateBar);


    //**********  Table Mova ********************
    HSet.Active := False;
    HSet.TableName := {ExtractFilePath(Application.ExeName)}put_arc_clon + '\' +'TempBufer\n_fobuch.dbf';
    HSet.Active := true;

    Label_hints.Caption := 'Iмпорт з таблицi n_fobuch.dbf';

    HSet.First;
    while not HSet.Eof do
    begin
      try
        posOne := posOne + 1;
        Synchronize(UpdateBar);

        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //SProc.Transaction.StartTransaction;
        SProc.StoredProcName:='CN_CHECKED_FOBUCH';
        SProc.Prepare;

        SProc.ParamByName('FOB').AsString       := HSet.FieldByName('FOB').AsString;
        SProc.ParamByName('NAME_FOB').AsString  := HSet.FieldByName('NFOB').AsString;
        SProc.ParamByName('NEKOR').Value        := HSet.FieldByName('NEKOR').Value;
        SProc.ParamByName('ID_FOB').AsString    := HSet.FieldByName('KOD_FORM').AsString;
        try
           SProc.ExecProc;
           //TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;

        //******* End Write  ***********************

      except on E : Exception
      do begin
          ShowMessage(E.Message);
          exit;
      end;
      end;
    HSet.Next;
    End;

        //**********  Table Mova ********************
    HSet.Active := False;
    HSet.TableName := {ExtractFilePath(Application.ExeName)}put_arc_clon + '\' +'TempBufer\n_vobuch.dbf';
    HSet.Active := true;

    Label_hints.Caption := 'Iмпорт з таблицi n_vobuch.dbf';

    HSet.First;
    while not HSet.Eof do
    begin
      try
        posOne := posOne + 1;
        Synchronize(UpdateBar);

        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //SProc.Transaction.StartTransaction;
        SProc.StoredProcName:='CN_CHECKED_VOBUCH';
        SProc.Prepare;
        SProc.ParamByName('KFOB').AsInt64         := HSet.FieldValues['KFOB'];
        SProc.ParamByName('KOD_FORM').AsInt64     := HSet.FieldValues['KOD_FORM'];
        SProc.ParamByName('NAME_RUS').AsString    := HSet.FieldByName('NAMERUS').AsString;
        SProc.ParamByName('NAME_UKR').AsString    := HSet.FieldByName('NAMEUKR').AsString;
        SProc.ParamByName('PRIMECH').AsString     := HSet.FieldByName('PRIMECH').AsString;
        try
           SProc.ExecProc;
           //TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;

        //******* End Write  ***********************

      except on E : Exception
      do begin
          ShowMessage(E.Message);
          exit;
      end;
      end;
    HSet.Next;
    End;


    posAll := 25;
    Synchronize(UpdateBar);

    posOne := 0;
    Synchronize(UpdateBar);


        //**********  Table Mova ********************
    HSet.Active := False;
    HSet.TableName := {ExtractFilePath(Application.ExeName)}put_arc_clon + '\' +'TempBufer\n_vidsp.dbf';
    HSet.Active := true;

    Label_hints.Caption := 'Iмпорт з таблицi n_vidsp.dbf';

    HSet.First;
    while not HSet.Eof do
    begin
      try
        posOne := posOne + 1;
        Synchronize(UpdateBar);

        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //SProc.Transaction.StartTransaction;
        SProc.StoredProcName:='CN_CHECKED_VIDSP';
        SProc.Prepare;

        SProc.ParamByName('VIDSP').Value      := HSet.FieldByName('VIDSP').Value;
        SProc.ParamByName('NAMESP').Value     := HSet.FieldByName('NAMESP').Value;
        SProc.ParamByName('pri').Value        := HSet.FieldByName('pri').Value;
        SProc.ParamByName('NEKOR').Value      := HSet.FieldByName('NEKOR').Value;
        try
           SProc.ExecProc;
           //TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;

        //******* End Write  ***********************

      except on E : Exception
      do begin
          ShowMessage(E.Message);
          exit;
      end;
      end;
    HSet.Next;
    End;


    posAll := 30;
    Synchronize(UpdateBar);

    posOne := 0;
    Synchronize(UpdateBar);

        //**********  Table Mova ********************
    HSet.Active := False;
    HSet.TableName := {ExtractFilePath(Application.ExeName)}put_arc_clon + '\' +'TempBufer\n_spec.dbf';
    HSet.Active := true;

    Label_hints.Caption := 'Iмпорт з таблицi n_spec.dbf';

    HSet.First;
    while not HSet.Eof do
    begin
      try
        posOne := posOne + 1;
        Synchronize(UpdateBar);


        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //SProc.Transaction.StartTransaction;
        SProc.StoredProcName:='CN_CHECKED_SPEC';
        SProc.Prepare;

        SProc.ParamByName('SSP').Value     := HSet.FieldByName('SSP').Value;
        SProc.ParamByName('NSP').Value     := HSet.FieldByName('NSP').Value;
        SProc.ParamByName('SXE1').Value    := HSet.FieldByName('SXE1').Value;
        SProc.ParamByName('NEKOR').Value   := HSet.FieldByName('NEKOR').Value;
        if HSet.FieldByName('MOVA').AsString = ''
        then begin SProc.ParamByName('MOVA').Value    := '1'; end
        else begin SProc.ParamByName('MOVA').Value    := HSet.FieldByName('MOVA').Value; end;
        SProc.ParamByName('SPEC_R').Value  := HSet.FieldByName('SPEC_R').Value;
        try
           SProc.ExecProc;
          // TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;

        //******* End Write  ***********************

      except on E : Exception
      do begin
          ShowMessage(E.Message);
          exit;
      end;
      end;
    HSet.Next;
    End;


    posAll := 35;
    Synchronize(UpdateBar);

    posOne := 0;
    Synchronize(UpdateBar);


 //**********  Table Mova ********************
    HSet.Active := False;
    HSet.TableName := {ExtractFilePath(Application.ExeName)}put_arc_clon + '\' +'TempBufer\payer.dbf';
    HSet.Active := true;

    Label_hints.Caption := 'Iмпорт з таблицi payer.dbf';

    HSet.First;
    while not HSet.Eof do
    begin
      try
        posOne := posOne + 1;
        Synchronize(UpdateBar);


        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //SProc.Transaction.StartTransaction;
        SProc.StoredProcName:='CN_CHECKED_PAYER';
        SProc.Prepare;

        SProc.ParamByName('KOD_PAYER').Value := HSet.FieldByName('KOD_PAYER').Value;
        SProc.ParamByName('NAME').Value      := HSet.FieldByName('NAME').Value;
        try
           SProc.ExecProc;
          // TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;

        //******* End Write  ***********************

      except on E : Exception
      do begin
          ShowMessage(E.Message);
          exit;
      end;
      end;
    HSet.Next;
    End;


    posAll := 40;
    Synchronize(UpdateBar);

    posOne := 0;
    Synchronize(UpdateBar);


//**********  Table Mova ********************
    HSet.Active := False;
    HSet.TableName := {ExtractFilePath(Application.ExeName)}put_arc_clon + '\' +'TempBufer\n_etopl.dbf';
    HSet.Active := true;

    Label_hints.Caption := 'Iмпорт з таблицi n_etopl.dbf';

    HSet.First;
    while not HSet.Eof do
    begin
      try
        posOne := posOne + 1;
        Synchronize(UpdateBar);


        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //SProc.Transaction.StartTransaction;
        SProc.StoredProcName:='CN_CHECKED_ETOPL';
        SProc.Prepare;
        SProc.ParamByName('KOD_T_UNIT').Value   := HSet.FieldByName('KOD_T_UNIT').Value;
        SProc.ParamByName('SETOPL').Value       := HSet.FieldByName('SETOPL').Value;
        SProc.ParamByName('NETOPL').Value       := HSet.FieldByName('NETOPL').Value;
        SProc.ParamByName('KOL').Value          := HSet.FieldByName('KOL').Value;
        try
           SProc.ExecProc;
          // TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;

        //******* End Write  ***********************

      except on E : Exception
      do begin
          ShowMessage(E.Message);
          exit;
      end;
      end;
    HSet.Next;
    End;


    posAll := 45;
    Synchronize(UpdateBar);

    posOne := 0;
    Synchronize(UpdateBar);


//**********  Table Mova ********************
    posOneMax :=4879;
    Synchronize(UpdateBar);
    HSet.Active := False;
    HSet.TableName := {ExtractFilePath(Application.ExeName)}put_arc_clon + '\' +'TempBufer\n_plp.dbf';
    HSet.Active := true;

    Label_hints.Caption := 'Iмпорт з таблицi n_plp.dbf';

    HSet.First;
    while not HSet.Eof do
    begin
      try
        posOne := posOne + 1;
        Synchronize(UpdateBar);


        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //SProc.Transaction.StartTransaction;
        SProc.StoredProcName:='CN_CHECKED_PLP';
        SProc.Prepare;

        SProc.ParamByName('SPLP').Value   := HSet.FieldByName('SPLP').Value;
        SProc.ParamByName('GPLP').Value   := HSet.FieldByName('GPLP').Value;
        SProc.ParamByName('NPLP').Value   := HSet.FieldByName('NPLP').Value;
        SProc.ParamByName('PADR').Value   := HSet.FieldByName('PADR').Value;
        SProc.ParamByName('SSB').Value    := HSet.FieldByName('SSB').Value;
        SProc.ParamByName('RCH').Value    := HSet.FieldByName('RCH').Value;
        SProc.ParamByName('SVO').Value    := HSet.FieldByName('SVO').Value;
        SProc.ParamByName('MFO').Value    := HSet.FieldByName('MFO').Value;
        SProc.ParamByName('OKP').Value    := HSet.FieldByName('OKP').Value;
        SProc.ParamByName('NEKOR').Value  := HSet.FieldByName('NEKOR').Value;
        try
           SProc.ExecProc;
          // TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;

        //******* End Write  ***********************

      except on E : Exception
      do begin
          ShowMessage(E.Message);
          exit;
      end;
      end;
    HSet.Next;
    End;


    posAll := 50;
    Synchronize(UpdateBar);

    posOne := 0;
    Synchronize(UpdateBar);


//**********  Table Mova ********************
    posOneMax :=200;
    Synchronize(UpdateBar);
    HSet.Active := False;
    HSet.TableName := {ExtractFilePath(Application.ExeName)}put_arc_clon + '\' +'TempBufer\n_kdog.dbf';
    HSet.Active := true;

    Label_hints.Caption := 'Iмпорт з таблицi n_kdog.dbf';

    HSet.First;
    while not HSet.Eof do
    begin
      try
        posOne := posOne + 1;
        Synchronize(UpdateBar);

        if HSet.FieldByName('RAZ_OPL').Value = false then
        begin
            raz_opl := 0;
        end else
        begin
            raz_opl := 1;
        end;

        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //SProc.Transaction.StartTransaction;
        SProc.StoredProcName:='CN_CHECKED_KDOG';
        SProc.Prepare;
        SProc.ParamByName('id_kd').AsInt64     := HSet.FieldByName('id_kd').AsVariant;
        SProc.ParamByName('KVD').AsString      := HSet.FieldByName('KVD').AsString;
        SProc.ParamByName('KD').AsString       := HSet.FieldByName('KD').AsString;
        SProc.ParamByName('ndog').AsString     := HSet.FieldByName('ndog').AsString;
        SProc.ParamByName('kdox').AsString     := HSet.FieldByName('kdox').AsString;
        SProc.ParamByName('nekor').AsString    := HSet.FieldByName('nekor').AsString;
        SProc.ParamByName('pri').AsInteger     := HSet.FieldByName('pri').AsInteger;
        SProc.ParamByName('propl').AsString    := HSet.FieldByName('propl').AsString;
        SProc.ParamByName('raz_opl').AsInteger := raz_opl;
        SProc.ParamByName('pstoim').AsString   := HSet.FieldByName('pstoim').AsString;
        SProc.ParamByName('obakr').AsString    := HSet.FieldByName('obakr').AsString;
        try
           SProc.ExecProc;
      //     TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;

        //******* End Write  ***********************

      except on E : Exception
      do begin
          ShowMessage(E.Message);
          exit;
      end;
      end;
    HSet.Next;
    End;


    posAll := 55;
    Synchronize(UpdateBar);

    posOne := 0;
    Synchronize(UpdateBar);


//**********  Table Mova ********************
    posOneMax :=550;
    Synchronize(UpdateBar);

    HSet.Active := False;
    HSet.TableName := {ExtractFilePath(Application.ExeName)}put_arc_clon + '\' +'TempBufer\n_podr.dbf';
    HSet.Active := true;

    Label_hints.Caption := 'Iмпорт з таблицi n_podr.dbf';

    HSet.First;
    while not HSet.Eof do
    begin
      try
        posOne := posOne + 1;
        Synchronize(UpdateBar);

        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //SProc.Transaction.StartTransaction;
        SProc.StoredProcName:='CN_CHECKED_PODR';
        SProc.Prepare;
        SProc.ParamByName('sxe1').AsString      := HSet.FieldByName('sxe1').AsString;
        SProc.ParamByName('sxe').AsString       := HSet.FieldByName('sxe').AsString;
        SProc.ParamByName('npodr').AsString     := HSet.FieldByName('npodr').AsString;
        SProc.ParamByName('fiorpodr').AsString  := HSet.FieldByName('fiorpodr').AsString;
        SProc.ParamByName('ts').AsString        := HSet.FieldByName('ts').AsString;
        SProc.ParamByName('tn').AsString        := HSet.FieldByName('tn').AsString;
        SProc.ParamByName('tk').AsString        := HSet.FieldByName('tk').AsString;
        SProc.ParamByName('razdn').AsString     := HSet.FieldByName('razdn').AsString;
        SProc.ParamByName('sxe2').AsString      := HSet.FieldByName('sxe2').AsString;
        SProc.ParamByName('fak').AsString       := HSet.FieldByName('fak').AsString;
        SProc.ParamByName('kdpredpr').AsString  := HSet.FieldByName('kdpredpr').AsString;
        SProc.ParamByName('rdlichn').AsString   := HSet.FieldByName('rdlichn').AsString;
        SProc.ParamByName('uk_npodr').AsString  := HSet.FieldByName('uk_npodr').AsString;
        SProc.ParamByName('dejk').AsString      := HSet.FieldByName('dejk').AsString;
        SProc.ParamByName('spodr').AsInteger    := HSet.FieldByName('spodr').AsInteger;
        try
           SProc.ExecProc;
           //TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;

        //******* End Write  ***********************

      except on E : Exception
      do begin
          ShowMessage(E.Message);
          exit;
      end;
      end;
    HSet.Next;
    End;

    posAll := 60;
    Synchronize(UpdateBar);

    posOne := 0;
    Synchronize(UpdateBar);

    //TransWr.Commit;

    //**********  Table Mova ********************
    posOneMax :=203;
    Synchronize(UpdateBar);
    HSet.Active := False;
    HSet.TableName := {ExtractFilePath(Application.ExeName)}put_arc_clon + '\' +'TempBufer\buxpeopl.DBF';
    HSet.Active := true;

    Label_hints.Caption := 'Iмпорт з таблицi buxpeopl.DBF';

    HSet.First;
    while not HSet.Eof do
    begin
      try
        posOne := posOne + 1;
        Synchronize(UpdateBar);

    //**********************************************************************
     {   TextEdit_look.Text := HSet.FieldByName('FIO_RU').AsString;
        zpt := HSet.FieldByName('FIO_RU').AsString;//TextEdit_look.Text;
        long_pole:= IntToStr(length(zpt));// IntToStr(TextEdit_look.GetTextLen);
        for ir := 1 to StrToInt(long_pole) do
        begin
            if ((zpt[ir] <> 'i') and
                (zpt[ir] <> 'h') and
                (zpt[ir] <> 'p') and
                (zpt[ir] <> 'm') and
                (zpt[ir] <> 't') and
                (zpt[ir] <> 'e') and
                (zpt[ir] <> 'o') and
                (zpt[ir] <> 'a') and
                (zpt[ir] <> 'c') and
                (zpt[ir] <> 'b') and
                (zpt[ir] <> 'k') and
                (zpt[ir] <> 'I') and
                (zpt[ir] <> 'H') and
                (zpt[ir] <> 'P') and
                (zpt[ir] <> 'M') and
                (zpt[ir] <> 'T') and
                (zpt[ir] <> 'E') and
                (zpt[ir] <> 'O') and
                (zpt[ir] <> 'A') and
                (zpt[ir] <> 'C') and
                (zpt[ir] <> 'B') and
                (zpt[ir] <> 'K')) then
            begin zpt1 := zpt1 + zpt[ir]; end else
            begin
                if (zpt[ir] = 'i') then begin zpt1 := zpt1 + 'і'; end;
                if (zpt[ir] = 'h') then begin zpt1 := zpt1 + 'н'; end;
                if (zpt[ir] = 'p') then begin zpt1 := zpt1 + 'р'; end;
                if (zpt[ir] = 'm') then begin zpt1 := zpt1 + 'т'; end;
                if (zpt[ir] = 't') then begin zpt1 := zpt1 + 'т'; end;
                if (zpt[ir] = 'e') then begin zpt1 := zpt1 + 'е'; end;
                if (zpt[ir] = 'o') then begin zpt1 := zpt1 + 'о'; end;
                if (zpt[ir] = 'a') then begin zpt1 := zpt1 + 'а'; end;
                if (zpt[ir] = 'c') then begin zpt1 := zpt1 + 'с'; end;
                if (zpt[ir] = 'b') then begin zpt1 := zpt1 + 'б'; end;
                if (zpt[ir] = 'k') then begin zpt1 := zpt1 + 'к'; end;
                if (zpt[ir] = 'I') then begin zpt1 := zpt1 + 'І'; end;
                if (zpt[ir] = 'H') then begin zpt1 := zpt1 + 'Н'; end;
                if (zpt[ir] = 'P') then begin zpt1 := zpt1 + 'Р'; end;
                if (zpt[ir] = 'M') then begin zpt1 := zpt1 + 'М'; end;
                if (zpt[ir] = 'T') then begin zpt1 := zpt1 + 'Т'; end;
                if (zpt[ir] = 'E') then begin zpt1 := zpt1 + 'Е'; end;
                if (zpt[ir] = 'O') then begin zpt1 := zpt1 + 'О'; end;
                if (zpt[ir] = 'A') then begin zpt1 := zpt1 + 'А'; end;
                if (zpt[ir] = 'C') then begin zpt1 := zpt1 + 'С'; end;
                if (zpt[ir] = 'B') then begin zpt1 := zpt1 + 'В'; end;
                if (zpt[ir] = 'K') then begin zpt1 := zpt1 + 'К'; end;
            end;
        end;
        FIO_RU_zpt     := zpt1;
        zpt1 := '';

        TextEdit_look.Text := HSet.FieldByName('IMYA_RU').AsString;
        zpt := HSet.FieldByName('IMYA_RU').AsString; //TextEdit_look.Text;
        long_pole:=  IntToStr(length(zpt));// IntToStr(TextEdit_look.GetTextLen);
        for ir := 1 to StrToInt(long_pole) do
        begin
            if ((zpt[ir] <> 'i') and
                (zpt[ir] <> 'h') and
                (zpt[ir] <> 'p') and
                (zpt[ir] <> 'm') and
                (zpt[ir] <> 't') and
                (zpt[ir] <> 'e') and
                (zpt[ir] <> 'o') and
                (zpt[ir] <> 'a') and
                (zpt[ir] <> 'c') and
                (zpt[ir] <> 'b') and
                (zpt[ir] <> 'k') and
                (zpt[ir] <> 'I') and
                (zpt[ir] <> 'H') and
                (zpt[ir] <> 'P') and
                (zpt[ir] <> 'M') and
                (zpt[ir] <> 'T') and
                (zpt[ir] <> 'E') and
                (zpt[ir] <> 'O') and
                (zpt[ir] <> 'A') and
                (zpt[ir] <> 'C') and
                (zpt[ir] <> 'B') and
                (zpt[ir] <> 'K')) then
            begin zpt1 := zpt1 + zpt[ir]; end else
            begin
                if (zpt[ir] = 'i') then begin zpt1 := zpt1 + 'і'; end;
                if (zpt[ir] = 'h') then begin zpt1 := zpt1 + 'н'; end;
                if (zpt[ir] = 'p') then begin zpt1 := zpt1 + 'р'; end;
                if (zpt[ir] = 'm') then begin zpt1 := zpt1 + 'т'; end;
                if (zpt[ir] = 't') then begin zpt1 := zpt1 + 'т'; end;
                if (zpt[ir] = 'e') then begin zpt1 := zpt1 + 'е'; end;
                if (zpt[ir] = 'o') then begin zpt1 := zpt1 + 'о'; end;
                if (zpt[ir] = 'a') then begin zpt1 := zpt1 + 'а'; end;
                if (zpt[ir] = 'c') then begin zpt1 := zpt1 + 'с'; end;
                if (zpt[ir] = 'b') then begin zpt1 := zpt1 + 'б'; end;
                if (zpt[ir] = 'k') then begin zpt1 := zpt1 + 'к'; end;
                if (zpt[ir] = 'I') then begin zpt1 := zpt1 + 'І'; end;
                if (zpt[ir] = 'H') then begin zpt1 := zpt1 + 'Н'; end;
                if (zpt[ir] = 'P') then begin zpt1 := zpt1 + 'Р'; end;
                if (zpt[ir] = 'M') then begin zpt1 := zpt1 + 'М'; end;
                if (zpt[ir] = 'T') then begin zpt1 := zpt1 + 'Т'; end;
                if (zpt[ir] = 'E') then begin zpt1 := zpt1 + 'Е'; end;
                if (zpt[ir] = 'O') then begin zpt1 := zpt1 + 'О'; end;
                if (zpt[ir] = 'A') then begin zpt1 := zpt1 + 'А'; end;
                if (zpt[ir] = 'C') then begin zpt1 := zpt1 + 'С'; end;
                if (zpt[ir] = 'B') then begin zpt1 := zpt1 + 'В'; end;
                if (zpt[ir] = 'K') then begin zpt1 := zpt1 + 'К'; end;
            end;
        end;
        IMYA_RU_zpt    := zpt1;
        zpt1 := '';

        TextEdit_look.Text := HSet.FieldByName('OTCHEST_RU').AsString;
        zpt := HSet.FieldByName('OTCHEST_RU').AsString;// TextEdit_look.Text;
        long_pole:= IntToStr(length(zpt));// IntToStr(TextEdit_look.GetTextLen);
        for ir := 1 to StrToInt(long_pole) do
        begin
            if ((zpt[ir] <> 'i') and
                (zpt[ir] <> 'h') and
                (zpt[ir] <> 'p') and
                (zpt[ir] <> 'm') and
                (zpt[ir] <> 't') and
                (zpt[ir] <> 'e') and
                (zpt[ir] <> 'o') and
                (zpt[ir] <> 'a') and
                (zpt[ir] <> 'c') and
                (zpt[ir] <> 'b') and
                (zpt[ir] <> 'k') and
                (zpt[ir] <> 'I') and
                (zpt[ir] <> 'H') and
                (zpt[ir] <> 'P') and
                (zpt[ir] <> 'M') and
                (zpt[ir] <> 'T') and
                (zpt[ir] <> 'E') and
                (zpt[ir] <> 'O') and
                (zpt[ir] <> 'A') and
                (zpt[ir] <> 'C') and
                (zpt[ir] <> 'B') and
                (zpt[ir] <> 'K')) then
            begin zpt1 := zpt1 + zpt[ir]; end else
            begin
                if (zpt[ir] = 'i') then begin zpt1 := zpt1 + 'і'; end;
                if (zpt[ir] = 'h') then begin zpt1 := zpt1 + 'н'; end;
                if (zpt[ir] = 'p') then begin zpt1 := zpt1 + 'р'; end;
                if (zpt[ir] = 'm') then begin zpt1 := zpt1 + 'т'; end;
                if (zpt[ir] = 't') then begin zpt1 := zpt1 + 'т'; end;
                if (zpt[ir] = 'e') then begin zpt1 := zpt1 + 'е'; end;
                if (zpt[ir] = 'o') then begin zpt1 := zpt1 + 'о'; end;
                if (zpt[ir] = 'a') then begin zpt1 := zpt1 + 'а'; end;
                if (zpt[ir] = 'c') then begin zpt1 := zpt1 + 'с'; end;
                if (zpt[ir] = 'b') then begin zpt1 := zpt1 + 'б'; end;
                if (zpt[ir] = 'k') then begin zpt1 := zpt1 + 'к'; end;
                if (zpt[ir] = 'I') then begin zpt1 := zpt1 + 'І'; end;
                if (zpt[ir] = 'H') then begin zpt1 := zpt1 + 'Н'; end;
                if (zpt[ir] = 'P') then begin zpt1 := zpt1 + 'Р'; end;
                if (zpt[ir] = 'M') then begin zpt1 := zpt1 + 'М'; end;
                if (zpt[ir] = 'T') then begin zpt1 := zpt1 + 'Т'; end;
                if (zpt[ir] = 'E') then begin zpt1 := zpt1 + 'Е'; end;
                if (zpt[ir] = 'O') then begin zpt1 := zpt1 + 'О'; end;
                if (zpt[ir] = 'A') then begin zpt1 := zpt1 + 'А'; end;
                if (zpt[ir] = 'C') then begin zpt1 := zpt1 + 'С'; end;
                if (zpt[ir] = 'B') then begin zpt1 := zpt1 + 'В'; end;
                if (zpt[ir] = 'K') then begin zpt1 := zpt1 + 'К'; end;
            end;
        end;
        OTCHEST_RU_zpt := zpt1;
        zpt1 := '';
        }
        TextEdit_look.Text := HSet.FieldByName('FIO_UK').AsString;
        zpt := HSet.FieldByName('FIO_UK').AsString;// TextEdit_look.Text;
        long_pole:= IntToStr(length(zpt));// IntToStr(TextEdit_look.GetTextLen);
        for ir := 1 to StrToInt(long_pole) do
        begin
            if ((zpt[ir] <> 'I') and
                (zpt[ir] <> 'H') and
                (zpt[ir] <> 'P') and
                (zpt[ir] <> 'M') and
                (zpt[ir] <> 'T') and
                (zpt[ir] <> 'E') and
                (zpt[ir] <> 'O') and
                (zpt[ir] <> 'A') and
                (zpt[ir] <> 'C') and
                (zpt[ir] <> 'B') and
                (zpt[ir] <> 'K')) then
            begin zpt1 := zpt1 + zpt[ir]; end else
            begin
                if (zpt[ir] = 'I') then begin zpt1 := zpt1 + 'І'; end;
                if (zpt[ir] = 'H') then begin zpt1 := zpt1 + 'Н'; end;
                if (zpt[ir] = 'P') then begin zpt1 := zpt1 + 'Р'; end;
                if (zpt[ir] = 'M') then begin zpt1 := zpt1 + 'М'; end;
                if (zpt[ir] = 'T') then begin zpt1 := zpt1 + 'Т'; end;
                if (zpt[ir] = 'E') then begin zpt1 := zpt1 + 'Е'; end;
                if (zpt[ir] = 'O') then begin zpt1 := zpt1 + 'О'; end;
                if (zpt[ir] = 'A') then begin zpt1 := zpt1 + 'А'; end;
                if (zpt[ir] = 'C') then begin zpt1 := zpt1 + 'С'; end;
                if (zpt[ir] = 'B') then begin zpt1 := zpt1 + 'В'; end;
                if (zpt[ir] = 'K') then begin zpt1 := zpt1 + 'К'; end;
            end;
        end;
        FIO_UK_zpt     := zpt1;
        zpt1 := '';

        TextEdit_look.Text := HSet.FieldByName('IMYA_UK').AsString;
        zpt := HSet.FieldByName('IMYA_UK').AsString;// TextEdit_look.Text;
        long_pole:= IntToStr(length(zpt));// IntToStr(TextEdit_look.GetTextLen);
        for ir := 1 to StrToInt(long_pole) do
        begin
            if ((zpt[ir] <> 'I') and
                (zpt[ir] <> 'H') and
                (zpt[ir] <> 'P') and
                (zpt[ir] <> 'M') and
                (zpt[ir] <> 'T') and
                (zpt[ir] <> 'E') and
                (zpt[ir] <> 'O') and
                (zpt[ir] <> 'A') and
                (zpt[ir] <> 'C') and
                (zpt[ir] <> 'B') and
                (zpt[ir] <> 'K')) then
            begin zpt1 := zpt1 + zpt[ir]; end else
            begin
                if (zpt[ir] = 'I') then begin zpt1 := zpt1 + 'І'; end;
                if (zpt[ir] = 'H') then begin zpt1 := zpt1 + 'Н'; end;
                if (zpt[ir] = 'P') then begin zpt1 := zpt1 + 'Р'; end;
                if (zpt[ir] = 'M') then begin zpt1 := zpt1 + 'М'; end;
                if (zpt[ir] = 'T') then begin zpt1 := zpt1 + 'Т'; end;
                if (zpt[ir] = 'E') then begin zpt1 := zpt1 + 'Е'; end;
                if (zpt[ir] = 'O') then begin zpt1 := zpt1 + 'О'; end;
                if (zpt[ir] = 'A') then begin zpt1 := zpt1 + 'А'; end;
                if (zpt[ir] = 'C') then begin zpt1 := zpt1 + 'С'; end;
                if (zpt[ir] = 'B') then begin zpt1 := zpt1 + 'В'; end;
                if (zpt[ir] = 'K') then begin zpt1 := zpt1 + 'К'; end;
            end;
        end;
        IMYA_UK_zpt    := zpt1;
        zpt1 := '';

        TextEdit_look.Text := HSet.FieldByName('OTCHEST_UK').AsString;
        zpt := HSet.FieldByName('OTCHEST_UK').AsString;// TextEdit_look.Text;
        long_pole:= IntToStr(length(zpt));// IntToStr(TextEdit_look.GetTextLen);
        for ir := 1 to StrToInt(long_pole) do
        begin
            if ((zpt[ir] <> 'I') and
                (zpt[ir] <> 'H') and
                (zpt[ir] <> 'P') and
                (zpt[ir] <> 'M') and
                (zpt[ir] <> 'T') and
                (zpt[ir] <> 'E') and
                (zpt[ir] <> 'O') and
                (zpt[ir] <> 'A') and
                (zpt[ir] <> 'C') and
                (zpt[ir] <> 'B') and
                (zpt[ir] <> 'K')) then
            begin zpt1 := zpt1 + zpt[ir]; end else
            begin
                if (zpt[ir] = 'I') then begin zpt1 := zpt1 + 'І'; end;
                if (zpt[ir] = 'H') then begin zpt1 := zpt1 + 'Н'; end;
                if (zpt[ir] = 'P') then begin zpt1 := zpt1 + 'Р'; end;
                if (zpt[ir] = 'M') then begin zpt1 := zpt1 + 'М'; end;
                if (zpt[ir] = 'T') then begin zpt1 := zpt1 + 'Т'; end;
                if (zpt[ir] = 'E') then begin zpt1 := zpt1 + 'Е'; end;
                if (zpt[ir] = 'O') then begin zpt1 := zpt1 + 'О'; end;
                if (zpt[ir] = 'A') then begin zpt1 := zpt1 + 'А'; end;
                if (zpt[ir] = 'C') then begin zpt1 := zpt1 + 'С'; end;
                if (zpt[ir] = 'B') then begin zpt1 := zpt1 + 'В'; end;
                if (zpt[ir] = 'K') then begin zpt1 := zpt1 + 'К'; end;
            end;
        end;
        OTCHEST_UK_zpt := zpt1;
        zpt1           := '';
      //**********************************************************************//
        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //TransWr.StartTransaction;
        SProc.StoredProcName:='CN_CHECKED_BUXPEOPL';
        SProc.Prepare;
        SProc.ParamByName('NFIZL').AsInteger      := HSet.FieldByName('NFIZL').AsInteger;
        SProc.ParamByName('TIN').AsString         := HSet.FieldByName('TIN').AsString;
        SProc.ParamByName('FIO_RU').AsString      := HSet.FieldByName('FIO_RU').AsString;
        SProc.ParamByName('IMYA_RU').AsString     := HSet.FieldByName('IMYA_RU').AsString;
        SProc.ParamByName('OTCHEST_RU').AsString  := HSet.FieldByName('OTCHEST_RU').AsString;
        SProc.ParamByName('FIO_UK').AsString      := FIO_UK_zpt;//HSet.FieldByName('FIO_UK').AsString;
        SProc.ParamByName('IMYA_UK').AsString     := IMYA_UK_zpt;//HSet.FieldByName('IMYA_UK').AsString;
        SProc.ParamByName('OTCHEST_UK').AsString  := OTCHEST_UK_zpt;//HSet.FieldByName('OTCHEST_UK').AsString;
        SProc.ParamByName('DATE_RO').AsString     := HSet.FieldByName('DATE_RO').AsString;
        try
           SProc.ExecProc;
           //TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;
        //******* End Write  ***********************

      except on E : Exception
      do begin
          ShowMessage(E.Message);
          exit;
      end;
      end;

    HSet.Next;
    End;


    posAll := 70;
    Synchronize(UpdateBar);

    posOne := 0;
    Synchronize(UpdateBar);



    //**********  Table Mova ********************
    posOneMax :=217;
    Synchronize(UpdateBar);
    HSet.Active := False;
    HSet.TableName := {ExtractFilePath(Application.ExeName)}put_arc_clon + '\' +'TempBufer\chtoplat.DBF';
    HSet.Active := true;

    Label_hints.Caption := 'Iмпорт з таблицi chtoplat.DBF';

    HSet.First;
    while not HSet.Eof do
    begin
      try
        posOne := posOne + 1;
        Synchronize(UpdateBar);

        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //TransWr.StartTransaction;
        SProc.StoredProcName:='CN_CHECKED_CHTOPLAT';
        SProc.Prepare;
        SProc.ParamByName('NDV').AsString         := HSet.FieldByName('NDV').AsString;
        SProc.ParamByName('NPPOR').AsInteger      := HSet.FieldByName('NPPOR').AsInteger;
        SProc.ParamByName('NPAYER').AsInteger     := HSet.FieldByName('NPAYER').AsInteger;
        SProc.ParamByName('setopl').AsString      := HSet.FieldByName('setopl').AsString;
        SProc.ParamByName('sumgod').AsString      := HSet.FieldByName('sumgod').AsString;
        SProc.ParamByName('svopl').AsString       := HSet.FieldByName('svopl').AsString;
        SProc.ParamByName('edizm').AsString       := HSet.FieldByName('edizm').AsString;
        SProc.ParamByName('diyanach').AsString    := HSet.FieldByName('diyanach').AsString;
        //SProc.ParamByName('diyakon').AsString     := HSet.FieldByName('diyakon').AsString;

        year1:=YearOf(HSet.FieldByName('diyanach').AsDateTime);
        year2:=YearOf(HSet.FieldByName('diyakon').AsDateTime);
        //******** Начало обработки даты ***************************************
        zamena_tmp := HSet.FieldByName('diyakon').AsString;
        zamena_tmp_cast := zamena_tmp[7] + zamena_tmp[8] + zamena_tmp[9] + zamena_tmp[10];
        zamena_tmp := zamena_tmp[1] + zamena_tmp[2] + zamena_tmp[3] + zamena_tmp[4] + zamena_tmp[5];
        if (zamena_tmp = '01.09')  and (year1<>year2) then
        begin
            SProc.ParamByName('diyakon').AsString := '30.06.' + zamena_tmp_cast;
        end else
        begin
            SProc.ParamByName('diyakon').AsString := HSet.FieldByName('diyakon').AsString;
        end;
        //******** Конец обработки даты ****************************************
        try
           SProc.ExecProc;
      //     TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;

        //******* End Write  ***********************

      except on E : Exception
      do begin
          ShowMessage(E.Message);
          exit;
      end;
      end;
    HSet.Next;
    End;


    posAll := 80;
    Synchronize(UpdateBar);

    posOne := 0;
    Synchronize(UpdateBar);

//**********  Table Mova ********************
    //SProc.Database:=DB;
    //SProc.Transaction:=TransWr;
    //SProc.Transaction.StartTransaction;
    SProc.StoredProcName:='CN_CHECKED_VOPL_CLEAR';
    SProc.Prepare;
    try
        SProc.ExecProc;
   //     TransWr.Commit;
    except on E:Exception do begin
        TransWr.Rollback;
        ShowMessage(E.Message);
    end end;

    HSet.Active := False;
    HSet.TableName := {ExtractFilePath(Application.ExeName)}put_arc_clon + '\' +'TempBufer\n_vopl.dbf';
    HSet.Active := true;

    Label_hints.Caption := 'Iмпорт з таблицi n_vopl.dbf';

    HSet.First;
    while not HSet.Eof do
    begin
      try
        posOne := posOne + 1;
        Synchronize(UpdateBar);

        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //SProc.Transaction.StartTransaction;
        SProc.StoredProcName:='CN_CHECKED_VOPL';
        SProc.Prepare;
        SProc.ParamByName('SVOPL').AsString         := HSet.FieldByName('SVOPL').AsString;
        SProc.ParamByName('EDIZM').AsString         := HSet.FieldByName('EDIZM').AsString;
        SProc.ParamByName('NVOPL').AsString         := HSet.FieldByName('NVOPL').AsString;
        SProc.ParamByName('NEKOR').AsString         := HSet.FieldByName('NEKOR').AsString;
        try
           SProc.ExecProc;
           //TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;

        //******* End Write  ***********************

      except on E : Exception
      do begin
          ShowMessage(E.Message);
          exit;
      end;
      end;
    HSet.Next;
    End;

//**********  Table Mova ********************
    posOneMax :=184;
    Synchronize(UpdateBar);
    HSet.Active := False;
    HSet.TableName := {ExtractFilePath(Application.ExeName)}put_arc_clon + '\' +'TempBufer\ktoplat.dbf';
    HSet.Active := true;

    Label_hints.Caption := 'Iмпорт з таблицi ktoplat.DBF';

    HSet.First;
    while not HSet.Eof do
    begin
      try
        posOne := posOne + 1;
        Synchronize(UpdateBar);

        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //SProc.Transaction.StartTransaction;
        SProc.StoredProcName:='CN_CHECKED_KTOPLAT';
        SProc.Prepare;
        SProc.ParamByName('ID_PLAT').AsInt64      := HSet.FieldByName('ID_PLAT').Asvariant;
        SProc.ParamByName('KOD_PAYER').AsInteger  := HSet.FieldByName('KOD_PAYER').AsInteger;
        SProc.ParamByName('NDV').AsString         := HSet.FieldByName('NDV').AsString;
        SProc.ParamByName('NPPOR').AsInteger      := HSet.FieldByName('NPPOR').AsInteger;
        SProc.ParamByName('NPAYER').AsInteger     := HSet.FieldByName('NPAYER').AsInteger;
        try
           SProc.ExecProc;
           //TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;

        //******* End Write  ***********************

      except on E : Exception
      do begin
          ShowMessage(E.Message);
          exit;
      end;
      end;
    HSet.Next;
    End;


    posAll := 95;
    Synchronize(UpdateBar);

    posOne := 0;
    Synchronize(UpdateBar);


    //**********  Table Mova ********************

        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //SProc.Transaction.StartTransaction;
        SProc.StoredProcName:='CN_INSERT_TO_LOG';
        SProc.Prepare;
        SProc.ParamByName('TIME_ADD').AsString := TimeToStr(Time);
        SProc.ParamByName('data_ADD').AsString := DateToStr(Date);
        SProc.ParamByName('S_arh').AsString    := 'S' + name_clon + '.rar';
        SProc.ParamByName('D_arh').AsString    := 'D' + name_clon + '.rar';
        try
           SProc.ExecProc;
           //TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;


//        ********  Table Mova ********************
    posOneMax :=181;
    Synchronize(UpdateBar);
    HSet.Active := False;
    HSet.TableName := {ExtractFilePath(Application.ExeName)}put_arc_clon + '\' +'TempBufer\dog_vc.DBF';
    HSet.Active := true;

    Label_hints.Caption := 'Iмпорт з таблицi dog_vc.dbf';

    //SProc.Database:=DB;
    //SProc.Transaction:=TransWr;
    //SProc.Transaction.StartTransaction;
    SProc.StoredProcName:='CN_CLEAR_VC_DOG_VC';
    SProc.Prepare;
    try
       SProc.ExecProc;
       //TransWr.Commit;
    except on E:Exception do begin
       TransWr.Rollback;
       ShowMessage(E.Message);
    end end;

    HSet.First;
    while not HSet.Eof do
    begin
      try
        posOne := posOne + 1;
        Synchronize(UpdateBar);

        //SProc.Database:=DB;
        //SProc.Transaction:=TransWr;
        //SProc.Transaction.StartTransaction;
        SProc.StoredProcName:='CN_CHECKED_DOG_VC';
        SProc.Prepare;
        SProc.ParamByName('NST_DOG').AsInt64      := HSet.FieldByName('NST_DOG').AsVariant;
        SProc.ParamByName('NFIZL').AsInteger      := HSet.FieldByName('NFIZL').AsInteger;
        SProc.ParamByName('KD').AsString          := HSet.FieldByName('KD').AsString;
        SProc.ParamByName('NDV').AsString         := HSet.FieldByName('NDV').AsString;
        SProc.ParamByName('NPPOR').AsInteger      := HSet.FieldByName('NPPOR').AsInteger;
        if (HSet.FieldByName('DDV').AsString = '') then
        SProc.ParamByName('DDV').AsString         := DateToStr(Date) else
        SProc.ParamByName('DDV').AsString         := HSet.FieldByName('DDV').AsString;
        SProc.ParamByName('DND').AsString         := HSet.FieldByName('DND').AsString;
        SProc.ParamByName('DOD').AsString         := HSet.FieldByName('DOD').AsString;
        SProc.ParamByName('KOLS').AsInteger       := HSet.FieldByName('KOLS').AsInteger;
        SProc.ParamByName('SPODRI').AsInteger     := HSet.FieldByName('SPODRI').AsInteger;
        SProc.ParamByName('KOD_FORM').AsInteger   := HSet.FieldByName('KOD_FORM').AsInteger;
        SProc.ParamByName('VIDSP').AsInteger      := HSet.FieldByName('VIDSP').AsInteger;
        SProc.ParamByName('KSZD').AsInteger       := HSet.FieldByName('KSZD').AsInteger;
        SProc.ParamByName('SSP').AsString         := HSet.FieldByName('SSP').AsString;
        SProc.ParamByName('MOVA').AsString        := HSet.FieldByName('MOVA').AsString;
        SProc.ParamByName('KSTRAN').AsString      := HSet.FieldByName('KSTRAN').AsString;
        SProc.ParamByName('KLETDOG').AsString     := HSet.FieldByName('KLETDOG').AsString;
        SProc.ParamByName('NDOK').AsString        := HSet.FieldByName('NDOK').AsString;
        if (HSet.FieldByName('DDOK').AsString = '') then
        SProc.ParamByName('DDOK').AsString        := DateToStr(Date) else
        SProc.ParamByName('DDOK').AsString        := HSet.FieldByName('DDOK').AsString;
        SProc.ParamByName('GRUP').AsString        := HSet.FieldByName('GRUP').AsString;
        SProc.ParamByName('NAMEG').AsString       := HSet.FieldByName('NAMEG').AsString;
        SProc.ParamByName('ID_KD').AsInt64        := HSet.FieldByName('ID_KD').AsVariant;
        SProc.ParamByName('DATE_GET').AsString    := DateToStr(Date);
        SProc.ParamByName('KOD_SM').AsInt64       := HSet.FieldByName('KOD_SM').AsVariant;

        try
           SProc.ExecProc;
           //TransWr.Commit;
        except on E:Exception do begin
           TransWr.Rollback;
           ShowMessage(E.Message);
        end end;

        //******* End Write  ***********************

      except on E : Exception
      do begin
          ShowMessage(E.Message);
          exit;
      end;
      end;
    HSet.Next;
    End;
    // КОМИТИМ ГЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ
    try
       TransWr.Commit;
       Label_hints.Caption := 'Iмпорт закiнчено вдало!';
       Label_hints.Font.Color := clGreen;
    except on E:Exception do begin
       TransWr.Rollback;
       Label_hints.Caption := 'Iмпорт закiнчено не вдало!';
       Label_hints.Font.Color := clRed;
       ShowMessage(E.Message);
    end end;

        //******* End Write  ***********************

//DB.Connected := False;
        PosAll := 100;
        PosOne := 200;

        ButtonDir.Enabled := true;
        ButtonImp.Enabled := true;
        Synchronize(UpdateBar);

        ButtonClose.Caption := 'Вийти';

        Destroy;
end;

procedure TfmImport.FormClose(Sender: TObject; var Action: TCloseAction);
var
    deleting_pass : string;
begin
    //if messageBox(Handle,PChar('Вы уверены, что хотите выйти из программы?'),
    //         'подтверждение',MB_YESNO or MB_ICONQUESTION)=mrYes then
    //begin
    deleting_pass := where_put_archiv + '\';
//    deleting_pass := ExtractFilePath(Application.ExeName);

    DeleteFile(deleting_pass+'setings.bat');
    DeleteFile(deleting_pass+'TempBufer\setings.bat');
    DeleteFile(deleting_pass+'TempBufer\D' + name + '.rar');
    DeleteFile(deleting_pass+'TempBufer\S' + name + '.rar');
    DeleteFile(deleting_pass+'TempBufer\rar.exe');
    DeleteFile(deleting_pass+'TempBufer\buxpeopl.DBF');
    DeleteFile(deleting_pass+'TempBufer\chtoplat.DBF');
    DeleteFile(deleting_pass+'TempBufer\dog_vc.DBF');
    DeleteFile(deleting_pass+'TempBufer\ktoplat.dbf');
    DeleteFile(deleting_pass+'TempBufer\n_banki.dbf');
    DeleteFile(deleting_pass+'TempBufer\n_etopl.dbf');
    DeleteFile(deleting_pass+'TempBufer\n_fobuch.dbf');
    DeleteFile(deleting_pass+'TempBufer\n_kdog.dbf');
    DeleteFile(deleting_pass+'TempBufer\N_KLS.DBF');
    DeleteFile(deleting_pass+'TempBufer\n_mova.dbf');
    DeleteFile(deleting_pass+'TempBufer\n_plp.dbf');
    DeleteFile(deleting_pass+'TempBufer\n_podr.dbf');
    DeleteFile(deleting_pass+'TempBufer\n_spec.dbf');
    DeleteFile(deleting_pass+'TempBufer\n_stran.dbf');
    DeleteFile(deleting_pass+'TempBufer\n_vidsp.dbf');
    DeleteFile(deleting_pass+'TempBufer\n_vobuch.dbf');
    DeleteFile(deleting_pass+'TempBufer\n_vopl.dbf');
    DeleteFile(deleting_pass+'TempBufer\payer.dbf');
    DeleteFile({name_path}deleting_pass+'\Rar.exe');
    RemoveDir(deleting_pass + 'TempBufer');
    
    if FormStyle = fsMDIChild then Action := caFree;
    // close;
    //end else Exit;
end;

procedure TfmImport.cxButton1Click(Sender: TObject);
var
    paramCopy : LongBool;
    i, j, k : integer;
    pathtofile, pathtodir : PChar;
    res : Variant;
    st : TextFile;
    Path : String;
    ProcessInfo : TProcessInformation;
	StartUpInfo : TStartupInfo;
    ir: integer;

    st2:TConnect;
begin
    {CreateDir('TempBufer');
    CreateDir('ARCHIV');
    CreateDir('ARCHIV\SPRAV');
    CreateDir('ARCHIV\SPRAV\'+DateToStr(Date));
    CreateDir('ARCHIV\DATA');
    CreateDir('ARCHIV\DATA\'+DateToStr(Date));}

    CreateDir(where_put_archiv + '\TempBufer');
    CreateDir(where_put_archiv + '\ARCHIV');
    CreateDir(where_put_archiv + '\ARCHIV\SPRAV');
    CreateDir(where_put_archiv + '\ARCHIV\SPRAV\'+DateToStr(Date));
    CreateDir(where_put_archiv + '\ARCHIV\DATA');
    CreateDir(where_put_archiv + '\ARCHIV\DATA\'+DateToStr(Date));

    name      := 'D' + name_last_archiva + '.rar';

    //*****Проверка типа файла
    try
    j := Length(name);
    k := StrToInt(name[j-4]);

    if (k >= 0) and (k <= 9) then
    begin
        name_test := name[j-2]+name[j-1] + name[j];
        //Label_hints.Caption := name_test;

        if (name_test <> 'rar') and (name_test <> 'RAR') then
        begin
            showMessage('Им''я файла невiрне!');
            Exit;
        end;

        //*****Забор номера архива
        name := name[j-10]+name[j-9]+name[j-8]+name[j-7]+name[j-6]+name[j-5]+name[j-4];

    end else
    begin
        ShowMessage('Им''я файла невiрне!');
        Exit;
    end;
    except on E:Exception do begin
          ShowMessage('Им''я файла невiрне!');
    end end;

    CopyFile(PChar((ExtractFilePath(Application.ExeName)+'Rar.exe')), PChar(({ExtractFilePath(Application.ExeName)}where_put_archiv + '\' +'TempBufer\Rar.exe')), paramCopy);

    i := Length(name_path);
    if name_path[i] = '\' then
    begin
        pathtofile := PChar((name_path+ 'S' + name + '.rar'));
        pathtodir  := PChar(({ExtractFilePath(Application.ExeName)}where_put_archiv + '\' +'ARCHIV\SPRAV\'+ DateToStr(Date)+'\S' + name + '.rar'));
    end else
    begin
        pathtofile := PChar((name_path+ '\S' + name + '.rar'));
        pathtodir  := PChar(({ExtractFilePath(Application.ExeName)}where_put_archiv + '\' +'ARCHIV\SPRAV\'+ DateToStr(Date)+'\S' + name + '.rar'));
    end;
    if not FileExists(pathtofile) then begin showmessage('Файл не знайдено!'); Exit; end;
    CopyFile(pathtofile, pathtodir, paramCopy);
    CopyFile(pathtofile, PChar(({ExtractFilePath(Application.ExeName)}where_put_archiv + '\' +'TempBufer\S' + name + '.rar')), paramCopy);

    i := Length(name_path);
    if name_path[i] = '\' then
    begin
        pathtofile := PChar((name_path+ 'D' + name + '.rar'));
        pathtodir:= PChar(({ExtractFilePath(Application.ExeName)}where_put_archiv + '\' +'ARCHIV\DATA\'+ DateToStr(Date)+'\D' + name + '.rar'));
    end else
    begin
        pathtofile := PChar((name_path+ '\D' + name + '.rar'));
        pathtodir:= PChar(({ExtractFilePath(Application.ExeName)}where_put_archiv + '\' +'ARCHIV\DATA\'+ DateToStr(Date)+'\D' + name + '.rar'));
    end;
    if not FileExists(pathtofile) then begin showmessage('Файл не знайдено!'); Exit; end;
    CopyFile(pathtofile, pathtodir, paramCopy);
    CopyFile(pathtofile, PChar(({ExtractFilePath(Application.ExeName)}where_put_archiv + '\' +'TempBufer\D' + name + '.rar')), paramCopy);


    //*****Создаём файл протатип
    Rewrite(st, {ExtractFilePath(Application.ExeName)}where_put_archiv + '\' +'TempBufer\setings.txt');
    CloseFile(st);
    //*****Пишем в него команду на выполнение
    Path := {ExtractFilePath(Application.ExeName)}where_put_archiv + '\' +'TempBufer\setings.txt';
    AssignFile(st, Path);
    append(st);
    Path := 'rar e -y ' + 'S' + name + '.rar' + ' ' + {ExtractFilePath(Application.ExeName)}where_put_archiv + '\' + 'TempBufer';
    Writeln(st, Path);
    CloseFile(st);

    Path := {ExtractFilePath(Application.ExeName)}where_put_archiv + '\' +'TempBufer\setings.txt';
    AssignFile(st, Path);
    append(st);
    Path := 'rar e -y ' + 'D' + name + '.rar' + ' ' + {ExtractFilePath(Application.ExeName)}where_put_archiv + '\' + 'TempBufer';
    Write(st, Path);
    CloseFile(st);

    //*****Переименовуем протатип в аналог


    Path := {ExtractFilePath(Application.ExeName)}where_put_archiv + '\' +'TempBufer\';
    RenameFile(Path+'setings.txt', Path+'setings.bat');

    //CopyFile(PChar((ExtractFilePath(Application.ExeName)+'TempBufer\setings.bat')), PChar((ExtractFilePath(Application.ExeName)+'setings.bat')), paramCopy);
    CopyFile(PChar((ExtractFilePath(Application.ExeName)+'Rar.exe')), PChar((name_path+'\Rar.exe')), paramCopy);

    //*****Выполняем аналог
    try
       Path_for_bat := PChar(({ExtractFilePath(Application.ExeName)}where_put_archiv + '\' +'TempBufer\setings.bat'));
       ShellExecute(handle, 'open', Path_for_bat, nil, nil, SW_SHOWNORMAL);
       ShowMessage('Тiльки що було проведено розархiвацiю!');
    except on E:Exception do begin
       ShowMessage(E.Message);
    end end;



    st2:=TConnect.create(ProgressBar_all,ProgressBar_one,
                         Database_CN,
                         TransactionRead, TransactionWrite,
                         StoredProc_CN,
                         cxButton3,cxButton2,cxButton1,
                         Label_chto_imp, Label_kuda_imp, Label_hint, 
                         HalcDataSetSelect,
                         where_put_archiv, name);

    //insert_data;
end;

procedure TConnect.Execute();
begin
    insert_data;
end;

procedure TfmImport.cxButton2Click(Sender: TObject);
begin
    close;
end;

procedure TfmImport.cxButton3Click(Sender: TObject);
var
    paramCopy : LongBool;
    i, j, k : integer;
    pathtofile, pathtodir : PChar;
    res : Variant;
    st : TextFile;
    Path : String;
    ProcessInfo : TProcessInformation;
	StartUpInfo : TStartupInfo;
begin
    res := UDialg_hunt.UPathAll(Self);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<> null) and (res[1]<> null) then
        begin
                name      := 'D' + name_last_archiva + '.rar';//res[0];
                name_path := res[1];
                where_put_archiv := name_path;

                CreateDir(where_put_archiv + '\TempBufer');
                CreateDir(where_put_archiv + '\ARCHIV');
                CreateDir(where_put_archiv + '\ARCHIV\SPRAV');
                CreateDir(where_put_archiv + '\ARCHIV\SPRAV\'+DateToStr(Date));
                CreateDir(where_put_archiv + '\ARCHIV\DATA');
                CreateDir(where_put_archiv + '\ARCHIV\DATA\'+DateToStr(Date));
        end;
    end;
    Label_chto_imp.Caption := 'Iмпортyеться: ' + name + ' и '+ 'S' + name_last_archiva + '.rar';
    Label_kuda_imp.Caption := 'З каталога: ' + name_path;
end;

procedure TConnect.UpdateBar;
begin
  //Label_hints.Caption            := Lhint_txt;
  ProgressBar_one.Properties.Max := posOneMax;
  ProgressBar_all.Position       := posAll;
  ProgressBar_one.Position       := posOne;
end;

destructor TConnect.Destroy;
var
   T : TfmImport;
begin
  Synchronize(UpdateBar);
  Inherited destroy;
end;

end.
