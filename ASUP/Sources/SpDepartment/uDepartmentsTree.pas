{*******************************************************************************
* uDepartmentsTree                                                             *
*                                                                              *
* Отображение дерева подразделений                                             *
* Copyright ©  2002-2004, Олег Г. Волков, Донецкий Национальный Университет    *
*******************************************************************************}

unit uDepartmentsTree;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, ExtCtrls, cxControls, cxContainer, cxTreeView,
    DB, cxGraphics, cxCustomData, cxStyles, cxTL, cxInplaceContainer,
    cxTLData, cxDBTL, cxMaskEdit, cxClasses, cxGridTableView, uSearchFrame,
    cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
    cxGridCustomView, cxGridCustomTableView, cxGridDBTableView, cxGrid,
    cxSplitter, uActionControl, uDepartmentsData, ActnList, uAddDepProp,
    Placemnt;

type
    TfmDepartmentsTree = class(TFrame)
        TreeSource: TDataSource;
        TreeList: TcxDBTreeList;
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
        qizzStyle: TcxGridTableViewStyleSheet;
        TreeListID_DEPARTMENT: TcxDBTreeListColumn;
        TreeListID_PARENT: TcxDBTreeListColumn;
        TreeListNAME_SHORT: TcxDBTreeListColumn;
        TreeListDISPLAY_ORDER: TcxDBTreeListColumn;
        TreeListDISPLAY_ORDER2: TcxDBTreeListColumn;
        TreeListNAME_FULL: TcxDBTreeListColumn;
        TreeListDISPLAY_NAME: TcxDBTreeListColumn;
        TreeListDEPARTMENT_CODE: TcxDBTreeListColumn;
        SearchFrame: TfmSearch;
        qStyle: TcxStyleRepository;
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
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        TreeListIsDELETED: TcxDBTreeListColumn;
        procedure TreeListKeyPress(Sender: TObject; var Key: Char);
        procedure TreeListKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure TreeListClick(Sender: TObject);
    private
        SelectDepartments: TDataSet;
    public
        // id_department, id_parent
        procedure Prepare(SelectDepartments: TDataSet);
        procedure Refresh;
    end;

implementation

{$R *.dfm}

uses uFormControl;

procedure TfmDepartmentsTree.Prepare(SelectDepartments: TDataSet);
begin
    Self.SelectDepartments := SelectDepartments;
    TreeSource.DataSet := SelectDepartments;
    Refresh;
    SearchFrame.Prepare(SelectDepartments);
end;

procedure TfmDepartmentsTree.Refresh;
begin
    SelectDepartments.Close;
    SelectDepartments.Open;
end;


procedure TfmDepartmentsTree.TreeListKeyPress(Sender: TObject;
    var Key: Char);
begin
    if (ord(Key) > 31) and not (Key in ['+', '-', '*']) then
        SearchFrame.SearchEdit.Text := SearchFrame.SearchEdit.Text + Key;
end;

procedure TfmDepartmentsTree.TreeListKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    case Key of
        VK_BACK: SearchFrame.SearchEdit.Text := '';
        ord('Z'): if (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
            try
                ShowMessage('Id_Department: ' + IntToStr(SelectDepartments['Id_Department']));
            except
            end;
    end;
end;

procedure TfmDepartmentsTree.TreeListClick(Sender: TObject);
begin
    SearchFrame.SearchEdit.Text := '';
end;

end.

