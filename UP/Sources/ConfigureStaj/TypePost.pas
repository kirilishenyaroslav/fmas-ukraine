unit TypePost;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, ActnList, ImgList,
    dxBar, dxBarExtItems, cxGridTableView, cxGridLevel,
    cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
    cxGridCustomView, cxGrid, ExtCtrls, StdCtrls, FIBDataSet, pFIBDataSet,
    cxCheckBox;

type
    TfrmTypePost = class(TForm)
        Panel3: TPanel;
        cxGrid3: TcxGrid;
        RaiseView: TcxGridDBTableView;
        cxGridDBColumn4: TcxGridDBColumn;
        cxGridDBColumn6: TcxGridDBColumn;
        cxGridDBColumn7: TcxGridDBColumn;
        cxGridDBColumn5: TcxGridDBColumn;
        cxGridLevel2: TcxGridLevel;
        cxStyleRepository1: TcxStyleRepository;
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
        cxStyle17: TcxStyle;
        cxStyle18: TcxStyle;
        cxStyle19: TcxStyle;
        cxStyle20: TcxStyle;
        cxStyle21: TcxStyle;
        cxStyle22: TcxStyle;
        cxStyle23: TcxStyle;
        cxStyle24: TcxStyle;
        cxStyle25: TcxStyle;
        cxStyle26: TcxStyle;
        cxStyle27: TcxStyle;
        cxStyle28: TcxStyle;
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        dxBarManager1: TdxBarManager;
        dxAdd: TdxBarLargeButton;
        dxDel: TdxBarLargeButton;
        dxRefresh: TdxBarLargeButton;
        dxPeriodEdit: TdxBarLargeButton;
        dxBarLargeButton1: TdxBarLargeButton;
        dxBarLargeButton2: TdxBarLargeButton;
        dxBarLargeButton3: TdxBarLargeButton;
        ImageList1: TImageList;
        ActionList1: TActionList;
        InsAct: TAction;
        DelAct: TAction;
        RefreshAct: TAction;
        PeriodEditAct: TAction;
        OkAct: TAction;
        CancelAct: TAction;
        RaiseViewDBColumn1: TcxGridDBColumn;
        Panel1: TPanel;
        EditSearch: TEdit;
        Label1: TLabel;
        TypePost: TpFIBDataSet;
        TypePostDS: TDataSource;
        procedure dxRefreshClick(Sender: TObject);
        procedure dxPeriodEditClick(Sender: TObject);
        procedure RaiseViewDblClick(Sender: TObject);
        procedure EditSearchChange(Sender: TObject);
        procedure RaiseViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    frmTypePost: TfrmTypePost;

implementation

{$R *.dfm}

uses SelectStaj, UpKernelUnit;

procedure TfrmTypePost.dxRefreshClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfrmTypePost.dxPeriodEditClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TfrmTypePost.RaiseViewDblClick(Sender: TObject);
begin
    dxRefreshClick(Self);
end;

procedure TfrmTypePost.EditSearchChange(Sender: TObject);
begin
    if EditSearch.Text <> '' then
    begin
        TypePost.Close;
        TypePost.SelectSQL.Text := 'select * from UP_POST_STAJ_CONF_SEL(:is_search, :name_search)';
        TypePost.ParamByName('is_search').AsString := 'T';
        TypePost.ParamByName('name_search').AsString := EditSearch.Text;
        TypePost.Open;
    end
    else
    begin
        TypePost.Close;
        TypePost.SelectSQL.Text := 'select * from UP_POST_STAJ_CONF_SEL(:is_search, :name_search)';
        TypePost.ParamByName('is_search').AsString := 'F';
        TypePost.ParamByName('name_search').AsString := '';
        TypePost.Open;
    end;
end;

procedure TfrmTypePost.RaiseViewKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift))
        then ShowInfo(TypePost);
end;

end.
