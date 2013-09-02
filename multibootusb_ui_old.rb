=begin
** Form generated from reading ui file 'untitled.ui'
**
** Created: Sun Jun 9 18:33:25 2013
**      by: Qt User Interface Compiler version 4.8.1
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_Dialog
    attr_reader :horizontalLayout
    attr_reader :tabWidget
    attr_reader :tab_3
    attr_reader :horizontalLayout_2
    attr_reader :gridLayout
    attr_reader :comboBox
    attr_reader :create
    attr_reader :close
    attr_reader :listWidget
    attr_reader :lineEdit
    attr_reader :browse_iso
    attr_reader :horizontalSpacer
    attr_reader :labelstep1
    attr_reader :labelstep2
    attr_reader :labelstep3
    attr_reader :progressBar
    attr_reader :groupBox
    attr_reader :verticalLayout
    attr_reader :gridLayout_5
    attr_reader :uninstall
    attr_reader :verticalSpacer_2
    attr_reader :verticalSpacer
    attr_reader :listdistro
    attr_reader :verticalSpacer_3
    attr_reader :label
    attr_reader :syslinux_ab
    attr_reader :horizontalLayout_3
    attr_reader :gridLayout_2
    attr_reader :groupBox_2
    attr_reader :horizontalLayout_4
    attr_reader :gridLayout_3
    attr_reader :install_syslinux
    attr_reader :horizontalSpacer_2
    attr_reader :install_sys_all
    attr_reader :install_sys_only
    attr_reader :groupBox_3
    attr_reader :horizontalLayout_5
    attr_reader :gridLayout_4
    attr_reader :edit_syslinux
    attr_reader :horizontalSpacer_3
    attr_reader :label_2
    attr_reader :tab
    attr_reader :verticalLayout_2
    attr_reader :groupBox_5
    attr_reader :verticalLayout_3
    attr_reader :gridLayout_7
    attr_reader :ram_iso_768
    attr_reader :ram_iso_256
    attr_reader :lineEdit_2
    attr_reader :ram_iso_512
    attr_reader :label_3
    attr_reader :browse_iso_qemu
    attr_reader :boot_iso_qemu
    attr_reader :ram_iso_1024
    attr_reader :ram_iso_2048
    attr_reader :gridLayout_6
    attr_reader :groupBox_4
    attr_reader :verticalLayout_4
    attr_reader :gridLayout_8
    attr_reader :label_6
    attr_reader :radioButton_9
    attr_reader :label_4
    attr_reader :radioButton_13
    attr_reader :radioButton_12
    attr_reader :radioButton_10
    attr_reader :radioButton_11
    attr_reader :boot_usb_qemu
    attr_reader :tab_2
    attr_reader :horizontalLayout_6
    attr_reader :gridLayout_10
    attr_reader :verticalSpacer_5
    attr_reader :horizontalSpacer_4
    attr_reader :verticalSpacer_4
    attr_reader :label_5
    attr_reader :horizontalSpacer_5

    def setupUi(dialog)
    if dialog.objectName.nil?
        dialog.objectName = "dialog"
    end
    dialog.resize(537, 420)
    icon = Qt::Icon.new
    icon.addPixmap(Qt::Pixmap.new("multibootusb.png"), Qt::Icon::Normal, Qt::Icon::Off)
    dialog.windowIcon = icon
    @horizontalLayout = Qt::HBoxLayout.new(dialog)
    @horizontalLayout.objectName = "horizontalLayout"
    @tabWidget = Qt::TabWidget.new(dialog)
    @tabWidget.objectName = "tabWidget"
    @tab_3 = Qt::Widget.new()
    @tab_3.objectName = "tab_3"
    @horizontalLayout_2 = Qt::HBoxLayout.new(@tab_3)
    @horizontalLayout_2.objectName = "horizontalLayout_2"
    @gridLayout = Qt::GridLayout.new()
    @gridLayout.objectName = "gridLayout"
    @comboBox = Qt::ComboBox.new(@tab_3)
    @comboBox.objectName = "comboBox"

    @gridLayout.addWidget(@comboBox, 0, 2, 1, 2)

    @create = Qt::PushButton.new(@tab_3)
    @create.objectName = "create"

    @gridLayout.addWidget(@create, 3, 3, 1, 1)

    @close = Qt::PushButton.new(@tab_3)
    @close.objectName = "close"

    @gridLayout.addWidget(@close, 3, 2, 1, 1)

    @listWidget = Qt::ListWidget.new(@tab_3)
    @listWidget.objectName = "listWidget"

    @gridLayout.addWidget(@listWidget, 0, 0, 2, 1)

    @lineEdit = Qt::LineEdit.new(@tab_3)
    @lineEdit.objectName = "lineEdit"

    @gridLayout.addWidget(@lineEdit, 2, 0, 1, 3)

    @browse_iso = Qt::PushButton.new(@tab_3)
    @browse_iso.objectName = "browse_iso"

    @gridLayout.addWidget(@browse_iso, 2, 3, 1, 1)

    @horizontalSpacer = Qt::SpacerItem.new(40, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @gridLayout.addItem(@horizontalSpacer, 1, 1, 1, 1)

    @labelstep1 = Qt::Label.new(@tab_3)
    @labelstep1.objectName = "labelstep1"

    @gridLayout.addWidget(@labelstep1, 0, 4, 1, 1)

    @labelstep2 = Qt::Label.new(@tab_3)
    @labelstep2.objectName = "labelstep2"

    @gridLayout.addWidget(@labelstep2, 2, 4, 1, 1)

    @labelstep3 = Qt::Label.new(@tab_3)
    @labelstep3.objectName = "labelstep3"

    @gridLayout.addWidget(@labelstep3, 3, 4, 1, 1)

    @progressBar = Qt::ProgressBar.new(@tab_3)
    @progressBar.objectName = "progressBar"
    @progressBar.value = 0

    @gridLayout.addWidget(@progressBar, 4, 0, 1, 5)

    @groupBox = Qt::GroupBox.new(@tab_3)
    @groupBox.objectName = "groupBox"
    @verticalLayout = Qt::VBoxLayout.new(@groupBox)
    @verticalLayout.objectName = "verticalLayout"
    @gridLayout_5 = Qt::GridLayout.new()
    @gridLayout_5.objectName = "gridLayout_5"
    @uninstall = Qt::PushButton.new(@groupBox)
    @uninstall.objectName = "uninstall"

    @gridLayout_5.addWidget(@uninstall, 3, 0, 1, 1)

    @verticalSpacer_2 = Qt::SpacerItem.new(20, 40, Qt::SizePolicy::Minimum, Qt::SizePolicy::Expanding)

    @gridLayout_5.addItem(@verticalSpacer_2, 4, 0, 1, 1)

    @verticalSpacer = Qt::SpacerItem.new(20, 40, Qt::SizePolicy::Minimum, Qt::SizePolicy::Expanding)

    @gridLayout_5.addItem(@verticalSpacer, 2, 0, 1, 1)

    @listdistro = Qt::RadioButton.new(@groupBox)
    @listdistro.objectName = "listdistro"

    @gridLayout_5.addWidget(@listdistro, 1, 0, 1, 1)

    @verticalSpacer_3 = Qt::SpacerItem.new(20, 40, Qt::SizePolicy::Minimum, Qt::SizePolicy::Expanding)

    @gridLayout_5.addItem(@verticalSpacer_3, 0, 0, 1, 1)


    @verticalLayout.addLayout(@gridLayout_5)


    @gridLayout.addWidget(@groupBox, 1, 2, 1, 2)

    @label = Qt::Label.new(@tab_3)
    @label.objectName = "label"

    @gridLayout.addWidget(@label, 3, 0, 1, 2)


    @horizontalLayout_2.addLayout(@gridLayout)

    @tabWidget.addTab(@tab_3, Qt::Application.translate("Dialog", "Multibootusb", nil, Qt::Application::UnicodeUTF8))
    @syslinux_ab = Qt::Widget.new()
    @syslinux_ab.objectName = "syslinux_ab"
    @horizontalLayout_3 = Qt::HBoxLayout.new(@syslinux_ab)
    @horizontalLayout_3.objectName = "horizontalLayout_3"
    @gridLayout_2 = Qt::GridLayout.new()
    @gridLayout_2.objectName = "gridLayout_2"
    @groupBox_2 = Qt::GroupBox.new(@syslinux_ab)
    @groupBox_2.objectName = "groupBox_2"
    @horizontalLayout_4 = Qt::HBoxLayout.new(@groupBox_2)
    @horizontalLayout_4.objectName = "horizontalLayout_4"
    @gridLayout_3 = Qt::GridLayout.new()
    @gridLayout_3.objectName = "gridLayout_3"
    @install_syslinux = Qt::PushButton.new(@groupBox_2)
    @install_syslinux.objectName = "install_syslinux"

    @gridLayout_3.addWidget(@install_syslinux, 2, 1, 1, 1)

    @horizontalSpacer_2 = Qt::SpacerItem.new(40, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @gridLayout_3.addItem(@horizontalSpacer_2, 2, 0, 1, 1)

    @install_sys_all = Qt::RadioButton.new(@groupBox_2)
    @install_sys_all.objectName = "install_sys_all"

    @gridLayout_3.addWidget(@install_sys_all, 1, 0, 1, 2)

    @install_sys_only = Qt::RadioButton.new(@groupBox_2)
    @install_sys_only.objectName = "install_sys_only"

    @gridLayout_3.addWidget(@install_sys_only, 0, 0, 1, 2)


    @horizontalLayout_4.addLayout(@gridLayout_3)


    @gridLayout_2.addWidget(@groupBox_2, 0, 0, 1, 1)

    @groupBox_3 = Qt::GroupBox.new(@syslinux_ab)
    @groupBox_3.objectName = "groupBox_3"
    @horizontalLayout_5 = Qt::HBoxLayout.new(@groupBox_3)
    @horizontalLayout_5.objectName = "horizontalLayout_5"
    @gridLayout_4 = Qt::GridLayout.new()
    @gridLayout_4.objectName = "gridLayout_4"
    @edit_syslinux = Qt::PushButton.new(@groupBox_3)
    @edit_syslinux.objectName = "edit_syslinux"

    @gridLayout_4.addWidget(@edit_syslinux, 1, 1, 1, 1)

    @horizontalSpacer_3 = Qt::SpacerItem.new(40, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @gridLayout_4.addItem(@horizontalSpacer_3, 1, 0, 1, 1)

    @label_2 = Qt::Label.new(@groupBox_3)
    @label_2.objectName = "label_2"

    @gridLayout_4.addWidget(@label_2, 0, 0, 1, 2)


    @horizontalLayout_5.addLayout(@gridLayout_4)


    @gridLayout_2.addWidget(@groupBox_3, 1, 0, 1, 1)


    @horizontalLayout_3.addLayout(@gridLayout_2)

    @tabWidget.addTab(@syslinux_ab, Qt::Application.translate("Dialog", "Syslinux", nil, Qt::Application::UnicodeUTF8))
    @tab = Qt::Widget.new()
    @tab.objectName = "tab"
    @verticalLayout_2 = Qt::VBoxLayout.new(@tab)
    @verticalLayout_2.objectName = "verticalLayout_2"
    @groupBox_5 = Qt::GroupBox.new(@tab)
    @groupBox_5.objectName = "groupBox_5"
    @verticalLayout_3 = Qt::VBoxLayout.new(@groupBox_5)
    @verticalLayout_3.objectName = "verticalLayout_3"
    @gridLayout_7 = Qt::GridLayout.new()
    @gridLayout_7.objectName = "gridLayout_7"
    @ram_iso_768 = Qt::RadioButton.new(@groupBox_5)
    @ram_iso_768.objectName = "ram_iso_768"

    @gridLayout_7.addWidget(@ram_iso_768, 1, 2, 1, 1)

    @ram_iso_256 = Qt::RadioButton.new(@groupBox_5)
    @ram_iso_256.objectName = "ram_iso_256"

    @gridLayout_7.addWidget(@ram_iso_256, 1, 0, 1, 1)

    @lineEdit_2 = Qt::LineEdit.new(@groupBox_5)
    @lineEdit_2.objectName = "lineEdit_2"

    @gridLayout_7.addWidget(@lineEdit_2, 0, 0, 1, 4)

    @ram_iso_512 = Qt::RadioButton.new(@groupBox_5)
    @ram_iso_512.objectName = "ram_iso_512"

    @gridLayout_7.addWidget(@ram_iso_512, 1, 1, 1, 1)

    @label_3 = Qt::Label.new(@groupBox_5)
    @label_3.objectName = "label_3"

    @gridLayout_7.addWidget(@label_3, 2, 0, 1, 4)

    @browse_iso_qemu = Qt::PushButton.new(@groupBox_5)
    @browse_iso_qemu.objectName = "browse_iso_qemu"

    @gridLayout_7.addWidget(@browse_iso_qemu, 0, 4, 1, 1)

    @boot_iso_qemu = Qt::PushButton.new(@groupBox_5)
    @boot_iso_qemu.objectName = "boot_iso_qemu"

    @gridLayout_7.addWidget(@boot_iso_qemu, 2, 4, 1, 1)

    @ram_iso_1024 = Qt::RadioButton.new(@groupBox_5)
    @ram_iso_1024.objectName = "ram_iso_1024"

    @gridLayout_7.addWidget(@ram_iso_1024, 1, 3, 1, 1)

    @ram_iso_2048 = Qt::RadioButton.new(@groupBox_5)
    @ram_iso_2048.objectName = "ram_iso_2048"

    @gridLayout_7.addWidget(@ram_iso_2048, 1, 4, 1, 1)


    @verticalLayout_3.addLayout(@gridLayout_7)


    @verticalLayout_2.addWidget(@groupBox_5)

    @gridLayout_6 = Qt::GridLayout.new()
    @gridLayout_6.objectName = "gridLayout_6"
    @groupBox_4 = Qt::GroupBox.new(@tab)
    @groupBox_4.objectName = "groupBox_4"
    @verticalLayout_4 = Qt::VBoxLayout.new(@groupBox_4)
    @verticalLayout_4.objectName = "verticalLayout_4"
    @gridLayout_8 = Qt::GridLayout.new()
    @gridLayout_8.objectName = "gridLayout_8"
    @label_6 = Qt::Label.new(@groupBox_4)
    @label_6.objectName = "label_6"

    @gridLayout_8.addWidget(@label_6, 0, 0, 1, 5)

    @radioButton_9 = Qt::RadioButton.new(@groupBox_4)
    @radioButton_9.objectName = "radioButton_9"

    @gridLayout_8.addWidget(@radioButton_9, 1, 4, 1, 1)

    @label_4 = Qt::Label.new(@groupBox_4)
    @label_4.objectName = "label_4"

    @gridLayout_8.addWidget(@label_4, 2, 0, 1, 4)

    @radioButton_13 = Qt::RadioButton.new(@groupBox_4)
    @radioButton_13.objectName = "radioButton_13"

    @gridLayout_8.addWidget(@radioButton_13, 1, 0, 1, 1)

    @radioButton_12 = Qt::RadioButton.new(@groupBox_4)
    @radioButton_12.objectName = "radioButton_12"

    @gridLayout_8.addWidget(@radioButton_12, 1, 1, 1, 1)

    @radioButton_10 = Qt::RadioButton.new(@groupBox_4)
    @radioButton_10.objectName = "radioButton_10"

    @gridLayout_8.addWidget(@radioButton_10, 1, 3, 1, 1)

    @radioButton_11 = Qt::RadioButton.new(@groupBox_4)
    @radioButton_11.objectName = "radioButton_11"

    @gridLayout_8.addWidget(@radioButton_11, 1, 2, 1, 1)

    @boot_usb_qemu = Qt::PushButton.new(@groupBox_4)
    @boot_usb_qemu.objectName = "boot_usb_qemu"

    @gridLayout_8.addWidget(@boot_usb_qemu, 2, 4, 1, 1)


    @verticalLayout_4.addLayout(@gridLayout_8)


    @gridLayout_6.addWidget(@groupBox_4, 0, 0, 1, 1)


    @verticalLayout_2.addLayout(@gridLayout_6)

    @tabWidget.addTab(@tab, Qt::Application.translate("Dialog", "QEMU", nil, Qt::Application::UnicodeUTF8))
    @tab_2 = Qt::Widget.new()
    @tab_2.objectName = "tab_2"
    @horizontalLayout_6 = Qt::HBoxLayout.new(@tab_2)
    @horizontalLayout_6.objectName = "horizontalLayout_6"
    @gridLayout_10 = Qt::GridLayout.new()
    @gridLayout_10.objectName = "gridLayout_10"
    @verticalSpacer_5 = Qt::SpacerItem.new(20, 40, Qt::SizePolicy::Minimum, Qt::SizePolicy::Minimum)

    @gridLayout_10.addItem(@verticalSpacer_5, 0, 1, 1, 1)

    @horizontalSpacer_4 = Qt::SpacerItem.new(40, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @gridLayout_10.addItem(@horizontalSpacer_4, 1, 0, 1, 1)

    @verticalSpacer_4 = Qt::SpacerItem.new(20, 30, Qt::SizePolicy::Minimum, Qt::SizePolicy::Minimum)

    @gridLayout_10.addItem(@verticalSpacer_4, 2, 1, 1, 1)

    @label_5 = Qt::Label.new(@tab_2)
    @label_5.objectName = "label_5"

    @gridLayout_10.addWidget(@label_5, 1, 1, 1, 1)

    @horizontalSpacer_5 = Qt::SpacerItem.new(40, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @gridLayout_10.addItem(@horizontalSpacer_5, 1, 2, 1, 1)


    @horizontalLayout_6.addLayout(@gridLayout_10)

    @tabWidget.addTab(@tab_2, Qt::Application.translate("Dialog", "About", nil, Qt::Application::UnicodeUTF8))

    @horizontalLayout.addWidget(@tabWidget)


    retranslateUi(dialog)

    @tabWidget.setCurrentIndex(0)


    Qt::MetaObject.connectSlotsByName(dialog)
    end # setupUi

    def setup_ui(dialog)
        setupUi(dialog)
    end

    def retranslateUi(dialog)
    dialog.windowTitle = Qt::Application.translate("Dialog", "multibootusb", nil, Qt::Application::UnicodeUTF8)
    @create.text = Qt::Application.translate("Dialog", "Create", nil, Qt::Application::UnicodeUTF8)
    @close.text = Qt::Application.translate("Dialog", "Close", nil, Qt::Application::UnicodeUTF8)
    @browse_iso.text = Qt::Application.translate("Dialog", "Browse ISO", nil, Qt::Application::UnicodeUTF8)
    @labelstep1.text = Qt::Application.translate("Dialog", "<html><head/><body><p align=\"center\"><span style=\" font-weight:600;\">Step 1</span></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @labelstep2.text = Qt::Application.translate("Dialog", "<html><head/><body><p align=\"center\"><span style=\" font-weight:600;\">Step 2</span></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @labelstep3.text = Qt::Application.translate("Dialog", "<html><head/><body><p align=\"center\"><span style=\" font-weight:600;\">Step 3</span></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @groupBox.title = Qt::Application.translate("Dialog", "Optional", nil, Qt::Application::UnicodeUTF8)
    @uninstall.text = Qt::Application.translate("Dialog", "Uninstall Distro", nil, Qt::Application::UnicodeUTF8)
    @listdistro.text = Qt::Application.translate("Dialog", "List Distros", nil, Qt::Application::UnicodeUTF8)
    @label.text = Qt::Application.translate("Dialog", "TextLabel", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@tab_3), Qt::Application.translate("Dialog", "Multibootusb", nil, Qt::Application::UnicodeUTF8))
    @groupBox_2.title = Qt::Application.translate("Dialog", "Install Syslinux", nil, Qt::Application::UnicodeUTF8)
    @install_syslinux.text = Qt::Application.translate("Dialog", "Install", nil, Qt::Application::UnicodeUTF8)
    @install_sys_all.text = Qt::Application.translate("Dialog", "Install syslinux and copy all required files.", nil, Qt::Application::UnicodeUTF8)
    @install_sys_only.text = Qt::Application.translate("Dialog", "Install only syslinux (existing configurations will not be altred).", nil, Qt::Application::UnicodeUTF8)
    @groupBox_3.title = Qt::Application.translate("Dialog", "Edit syslinux.cfg", nil, Qt::Application::UnicodeUTF8)
    @edit_syslinux.text = Qt::Application.translate("Dialog", "Edit", nil, Qt::Application::UnicodeUTF8)
    @label_2.text = Qt::Application.translate("Dialog", "<html><head/><body><p align=\"justify\">Using this option user can edit syslinux.cfg file directly. It directly uses </p><p align=\"justify\">default editor of host system. Be careful while editing syslinux.cfg file.</p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@syslinux_ab), Qt::Application.translate("Dialog", "Syslinux", nil, Qt::Application::UnicodeUTF8))
    @groupBox_5.title = Qt::Application.translate("Dialog", "Boot ISO", nil, Qt::Application::UnicodeUTF8)
    @ram_iso_768.text = Qt::Application.translate("Dialog", "768 MB", nil, Qt::Application::UnicodeUTF8)
    @ram_iso_256.text = Qt::Application.translate("Dialog", "256 MB", nil, Qt::Application::UnicodeUTF8)
    @ram_iso_512.text = Qt::Application.translate("Dialog", "512 MB", nil, Qt::Application::UnicodeUTF8)
    @label_3.text = Qt::Application.translate("Dialog", "Choose desired RAM and click on Boot ISO button.", nil, Qt::Application::UnicodeUTF8)
    @browse_iso_qemu.text = Qt::Application.translate("Dialog", "Browse ISO", nil, Qt::Application::UnicodeUTF8)
    @boot_iso_qemu.text = Qt::Application.translate("Dialog", "Boot ISO", nil, Qt::Application::UnicodeUTF8)
    @ram_iso_1024.text = Qt::Application.translate("Dialog", "1024 MB", nil, Qt::Application::UnicodeUTF8)
    @ram_iso_2048.text = Qt::Application.translate("Dialog", "2048 MB", nil, Qt::Application::UnicodeUTF8)
    @groupBox_4.title = Qt::Application.translate("Dialog", "Boot USB", nil, Qt::Application::UnicodeUTF8)
    @label_6.text = Qt::Application.translate("Dialog", "<html><head/><body><p align=\"justify\">Be careful. If not used with care you may end up loosing your usb.</p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @radioButton_9.text = Qt::Application.translate("Dialog", "2048 MB", nil, Qt::Application::UnicodeUTF8)
    @label_4.text = Qt::Application.translate("Dialog", "Choose desired RAM and click on Boot USB button.", nil, Qt::Application::UnicodeUTF8)
    @radioButton_13.text = Qt::Application.translate("Dialog", "256 MB", nil, Qt::Application::UnicodeUTF8)
    @radioButton_12.text = Qt::Application.translate("Dialog", "512 MB", nil, Qt::Application::UnicodeUTF8)
    @radioButton_10.text = Qt::Application.translate("Dialog", "1024 MB", nil, Qt::Application::UnicodeUTF8)
    @radioButton_11.text = Qt::Application.translate("Dialog", "768 MB", nil, Qt::Application::UnicodeUTF8)
    @boot_usb_qemu.text = Qt::Application.translate("Dialog", "Boot USB", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@tab), Qt::Application.translate("Dialog", "QEMU", nil, Qt::Application::UnicodeUTF8))
    @label_5.text = Qt::Application.translate("Dialog", "<html><head/><body><p align=\"center\">An advanced bootable usb creator with option to install/uninstall </p><p align=\"center\">multiple distros. This software is written in ruby and qtbindings. </p><p align=\"center\">Copyright 2010-2013 Sundar</p><p align=\"center\"><span style=\" font-weight:600; text-decoration: underline;\">Author</span>: Sundar</p><p align=\"center\"><span style=\" font-weight:600; text-decoration: underline;\">Contributor(s):</span> Ian Bruce, Ramesh</p><p align=\"center\"><span style=\" font-weight:600; text-decoration: underline;\">Licence:</span> GPL version 2 or later</p><p align=\"center\"><span style=\" font-weight:600; text-decoration: underline;\">Help/Email:</span> feedback.multibootusb@gmail.com</p><p align=\"center\"><span style=\" font-weight:600; text-decoration: underline;\">Home page: </span>http://sourceforge.net/projects/multibootusb/</p><p align=\"center\"><br/></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@tab_2), Qt::Application.translate("Dialog", "About", nil, Qt::Application::UnicodeUTF8))
    end # retranslateUi

    def retranslate_ui(dialog)
        retranslateUi(dialog)
    end

end

module Ui
    class Dialog < Ui_Dialog
    end
end  # module Ui

