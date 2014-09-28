unit UpComandOrderPosts;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxGridTableView,
    cxGridCustomTableView, cxGridDBTableView, cxGridLevel, cxClasses,
    cxControls, cxGridCustomView, cxGrid, dxBar, dxBarExtItems, ExtCtrls,
    ImgList, UpKernelUnit;

type
    TFormPost = class(TForm)
        dxBarManager1: TdxBarManager;
        Panel1: TPanel;
        dxBarDockControl1: TdxBarDockControl;
        dxRefreshBtn: TdxBarLargeButton;
        dxSelectBtn: TdxBarLargeButton;
        dxCloseBtn: TdxBarLargeButton;
        cxGridPostTableView: TcxGridDBTableView;
        cxGridPostLevel: TcxGridLevel;
        cxGridPost: TcxGrid;
        col_Id_Work_Dog_Moving: TcxGridDBColumn;
        col_Name_Post: TcxGridDBColumn;
        col_Name_Department: TcxGridDBColumn;
        col_Is_Post_Main: TcxGridDBColumn;
        col_Reason: TcxGridDBColumn;
        col_Rate_Count: TcxGridDBColumn;
        StyleRepository: TcxStyleRepository;
        stBackground: TcxStyle;
        stContent: TcxStyle;
        stContentEven: TcxStyle;
        stContentOdd: TcxStyle;
        stFilterBox: TcxStyle;
        stFooter: TcxStyle;
        stGroup: TcxStyle;
        stGroupByBox: TcxStyle;
        stHeader: TcxStyle;
        stInactive: TcxStyle;
        stIncSearch: TcxStyle;
        stIndicator: TcxStyle;
        stPreview: TcxStyle;
        stSelection: TcxStyle;
        stHotTrack: TcxStyle;
        qizzStyle: TcxGridTableViewStyleSheet;
        IL_OrdAcc: TImageList;
        procedure dxRefreshBtnClick(Sender: TObject);
        procedure dxCloseBtnClick(Sender: TObject);
        procedure dxSelectBtnClick(Sender: TObject);
        procedure cxGridPostTableViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure cxGridPostTableViewDblClick(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    FormPost: TFormPost;

implementation

{$R *.dfm}

procedure TFormPost.dxRefreshBtnClick(Sender: TObject);
begin
    cxGridPostTableView.DataController.DataSet.Refresh;
end;

procedure TFormPost.dxCloseBtnClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TFormPost.dxSelectBtnClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TFormPost.cxGridPostTableViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift))
        then
    begin
        ShowInfo(cxGridPostTableView.DataController.DataSet);
    end;
end;

procedure TFormPost.cxGridPostTableViewDblClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

end.
