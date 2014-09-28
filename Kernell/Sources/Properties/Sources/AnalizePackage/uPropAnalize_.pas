unit uPropAnalize_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, cxStyles,
  cxFilter,  DB, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, DateUtils, ImgList,Ibase, cxCustomData,
  cxGraphics, cxControls, cxData, cxDataStorage, cxDBData, cxEdit,
  GlobalSpr, Resources_unitb;

type


  TfrmPropAnalize = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    UpdateButton: TToolButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    AnalizeDataSet: TpFIBDataSet;
    AnalizeDataSource: TDataSource;
    PROP_TITLE_COL: TcxGridDBColumn;
    DATE_BEG_COL: TcxGridDBColumn;
    DATE_END_PROP: TcxGridDBColumn;
    GROUP_COL: TcxGridDBColumn;
    SCH_TITLE_COL: TcxGridDBColumn;
    ID_PROP_COL: TcxGridDBColumn;
    ID_SCH_COL: TcxGridDBColumn;
    SCH_END_COL: TcxGridDBColumn;
    SCH_BEG_COL: TcxGridDBColumn;
    colst: TcxStyle;
    SmallImages: TImageList;
    WorkDatabase: TpFIBDatabase;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    GConnection:TConfigConnStructure;
    Curr_data:TdateTime;
    Cur_mode:TViewMode;
    Id_Filter_Object:Integer;
    procedure SetPropView;
    procedure SetSchView;
    procedure SetGridViewMode(ViewMode:TViewMode);
    constructor Create(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; Curr_Date:TdateTime; Id_filter_obj:Integer; ViewMode:TViewMode;FS:TFormStyle); overload;
    constructor Create(AOwner:TComponent; Connection:TConfigConnStructure; Curr_Date:TdateTime;Id_filter_obj:Integer;ViewMode:TViewMode;FS:TFormStyle);overload;

    { Public declarations }
  end;


  function GetSprMDI  (AOwner:TComponent; DBHandle: TISC_DB_HANDLE; Curr_Date:TdateTime; Id_filter_obj:Integer; ViewMode:TViewMode;FS:TFormStyle):Integer;stdcall;
  function GetSprModal(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; Curr_Date:TdateTime; Id_filter_obj:Integer; ViewMode:TViewMode;FS:TFormStyle):Integer;stdcall;

  exports   GetSprMDI, GetSprModal;



implementation

{$R *.dfm}

function GetSprMDI  (AOwner:TComponent; DBHandle: TISC_DB_HANDLE; Curr_Date:TdateTime; Id_filter_obj:Integer; ViewMode:TViewMode;FS:TFormStyle):Integer;
begin
     Result:=integer(TfrmPropAnalize.Create(AOwner,DBHandle,Curr_Date,Id_filter_obj,ViewMode,fsMDIChild));
end;

function GetSprModal(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; Curr_Date:TdateTime; Id_filter_obj:Integer; ViewMode:TViewMode;FS:TFormStyle):Integer;
var  T:TfrmPropAnalize;
begin
     T:=TfrmPropAnalize.Create(AOwner,DBHandle,Curr_Date,Id_filter_obj,ViewMode,fsNormal);
     T.ShowModal;
     T.Free;
     Result:=0;
end;


constructor TfrmPropAnalize.Create(AOwner: TComponent;
  DBHandle: TISC_DB_HANDLE; Curr_Date: TdateTime;Id_filter_obj:Integer;ViewMode:TViewMode;FS:TFormStyle);
begin
      inherited Create(AOwner);
      self.WorkDatabase.Handle:=DBHandle;
      Curr_data:=Curr_Date;
      Id_Filter_Object:=Id_filter_obj;
      Cur_mode:=ViewMode;
      self.FormStyle:=FS;
end;

constructor TfrmPropAnalize.Create(AOwner: TComponent;
  Connection: TConfigConnStructure; Curr_Date: TdateTime;Id_filter_obj:Integer;ViewMode:TViewMode;FS:TFormStyle);
begin
      inherited Create(AOwner);
      self.FormStyle:=FS;
      WorkDatabase.DBParams.Add('user_name='+Connection.DB_USER);
      WorkDatabase.DBParams.Add('password='+Connection.DB_PASSWORD);
      WorkDatabase.DBParams.Add('lc_ctype=WIN1251');
      WorkDatabase.UseLoginPrompt := false;
      WorkDatabase.SQLDialect := 3;
      WorkDatabase.DatabaseName := Trim(Connection.DB_SERVER)+':'+Trim(Connection.DB_PATH);
      Screen.Cursor:=crHourGlass;
      WorkDatabase.Open;
      ReadTransaction.DefaultDatabase:=WorkDatabase;
      WriteTransaction.DefaultDatabase:=WorkDatabase;
      Screen.Cursor:=crDefault;
      Curr_data:=Curr_Date;
      Id_Filter_Object:=Id_filter_obj;
      Cur_mode:=ViewMode;
end;

procedure TfrmPropAnalize.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=CaFree;
end;

procedure TfrmPropAnalize.FormShow(Sender: TObject);
var date_str:string;
begin
     dateTimetostring(date_str,'dd.mm.yyyy', Curr_data);
     AnalizeDataSet.SQLs.SelectSQL.Text:='SELECT * FROM PUB_GET_PROP_SCH_ANALIZE('+''''+date_str+''''+',1)';
     if WorkDatabase.Connected
         then AnalizeDataSet.Open
         else Showmessage('БД по ссылке почемуто не открывается');
     SetGridViewMode(Cur_mode);
end;

procedure TfrmPropAnalize.SetGridViewMode(ViewMode: TViewMode);
begin
      case ViewMode of
         vmFixSch : SetSchView;
         vmFixProp: SetPropView;
      end;
end;

procedure TfrmPropAnalize.SetPropView;
var temp_dataset:TpFibDataSet;
begin
{Данный режим просмотра аналитики устанавливает
 фильтр по выбранному свойству и группирует записи по
 счетам}
       temp_dataset:=TpFibDataSet.Create(self);
       temp_dataset.Database:=WorkDatabase;
       temp_dataset.Transaction:=ReadTransaction;
       temp_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SP_PROPERTIES '+
                                         ' WHERE ID_PROP='+IntToStr(Id_Filter_Object);
       temp_dataset.Open;
       temp_dataset.FetchAll;
       if temp_dataset.RecordCount>0
       then begin
                    Caption:='Аналіз роботи властивості "'+temp_dataset.FieldByName('PROP_TITLE').AsString+'"';
                    with cxGrid1DBTableView1.DataController.Filter.Root do
                    begin
                          Clear;                         //Очищаем критерии которые были установлены ранее
                          BoolOperatorKind := fboOr;     //Устанавливаем логическую связку
                                                         //Добавляем условия фильтрации
                          //add new filter conditions
                          AddItem(ID_PROP_COL, foEqual, Id_Filter_Object,temp_dataset.FieldByName('PROP_TITLE').AsString);
                    end;
                    cxGrid1DBTableView1.DataController.Filter.Active:=true;
                    cxGrid1DBTableView1.DataController.Groups.ClearGrouping;
                    //ChangeGrouping(Номер столбца,Порядок группировки);
                    cxGrid1DBTableView1.DataController.Groups.ChangeGrouping(0,1);
                    cxGrid1DBTableView1.OptionsView.Footer:=false;
                    cxGrid1DBTableView1.ViewData.Expand(true);
       end;
       temp_dataset.Free;
end;

procedure TfrmPropAnalize.SetSchView;
var temp_dataset:TpFibDataSet;
    date_str,view_str:string;
begin
     {Данный режим просмотра аналитики устанавливает
      фильтр по выбранному счету и группирует записи по
      свойствам}
       dateTimetostring(date_str,'dd.mm.yyyy', Curr_data);
       temp_dataset:=TpFibDataSet.Create(self);
       temp_dataset.Database:=WorkDatabase;
       temp_dataset.Transaction:=ReadTransaction;

       temp_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SP_MAIN_SCH_SELECT('+''''+date_str+''''+','+IntToStr(DEFAULT_ROOT_ID)+')'+
                                         ' WHERE ID_SCH='+IntToStr(Id_Filter_Object);
       temp_dataset.Open;
       temp_dataset.FetchAll;
       if temp_dataset.RecordCount>0
       then begin
                  view_str:='"'+temp_dataset.FieldByName('SCH_NUMBER').AsString+' '+temp_dataset.FieldByName('SCH_TITLE').AsString+'"';
                  Caption:='Аналіз роботи властивостей на рахунку баланса '+view_str;
                  with cxGrid1DBTableView1.DataController.Filter.Root do
                  begin
                        Clear;                         //Очищаем критерии которые были установлены ранее
                        BoolOperatorKind := fboOr;     //Устанавливаем логическую связку
                                                       //Добавляем условия фильтрации
                        //add new filter conditions
                        AddItem(ID_SCH_COL, foEqual, Id_Filter_Object, view_str);
                  end;
                  cxGrid1DBTableView1.DataController.Filter.Active:=true;
                  cxGrid1DBTableView1.DataController.Groups.ClearGrouping;
                  //ChangeGrouping(Номер столбца,Порядок группировки);
                  cxGrid1DBTableView1.DataController.Groups.ChangeGrouping(4,1);
                  cxGrid1DBTableView1.DataController.Groups.ChangeGrouping(1,1);
                  //SCH_TITLE_COL.Visible:=false;
                  cxGrid1DBTableView1.OptionsView.Footer:=false;
                  cxGrid1DBTableView1.ViewData.Expand(true);
                  cxGrid1DBTableView1.OptionsView.Footer:=false;
       end;
       temp_dataset.Free;
end;


procedure TfrmPropAnalize.FormCreate(Sender: TObject);
begin
    PROP_TITLE_COL.Caption:=PUB_COLTITL_PROP_TITLE;
    DATE_BEG_COL.Caption:=PUB_COLTITL_DATE_BEG;
    DATE_END_PROP.Caption:=PUB_COLTITL_DATE_END;
    GROUP_COL.Caption:=PUB_COLTITL_GROUP;
    SCH_TITLE_COL.Caption:=PUB_COLTITL_SCH_TITLE;
    ID_PROP_COL.Caption:=PUB_COLTITL_ID_PROP;
    ID_SCH_COL.Caption:=PUB_COLTITL_ID_SCH;
    SCH_END_COL.Caption:=PUB_COLTITL_SCH_END;
    SCH_BEG_COL.Caption:=PUB_COLTITL_SCH_BEG;
end;

end.



