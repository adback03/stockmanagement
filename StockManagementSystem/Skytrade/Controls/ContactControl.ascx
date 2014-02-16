<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactControl.ascx.cs" Inherits="Controls_ContactControl" %>

<div id="contact" class="tab-pane">
    <div class="row-fluid">
        <div class="span5">
            <h4><i class="icon-envelope-alt"></i>&nbsp;&nbsp;Contact Us</h4>
            <label>Name</label>
            <input type="text" value="" id="Text3" class="input-block-level" />
            <label>Email</label>
            <input type="text" value="" id="Text4" class="input-block-level" />
            <label>Mobile No</label>
            <input type="text" value="" id="Text5" class="input-block-level" />
            <label>Message</label>
            <textarea class="input-block-level" rows="5"></textarea>
            <a href="#" class=" btn ">Send Message&nbsp;&nbsp;&nbsp;<i class="icon-chevron-sign-right"></i></a>
            <br class="visible-phone" />
            <br class="visible-phone" />
        </div>
        <div class="span7">
            <div class="row-fluid">
                <div class="span12">
                    <h4><i class="icon-location-arrow"></i>&nbsp;&nbsp;Locate Us</h4>
                    <div class="map"></div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span6">
                    <h4><i class="icon-envelope-alt"></i>&nbsp;&nbsp;Contact Us</h4>
                    <address>
                        <strong>Full Name</strong><br>
                        <a href="mailto:#">first.last@example.com</a>
                    </address>
                </div>
                <div class="span6">
                    <h4><i class="icon-location-arrow"></i>&nbsp;&nbsp;Our Address</h4>

                    <address>
                        <strong>Sky Trade, Inc.</strong><br>
                        1500 La Crosse St<br>
                        La Crosse, WI 54601<br>
                        <abbr title="Phone">P:</abbr>
                        (123) 456-7890
                    </address>
                </div>
            </div>
        </div>
    </div>
</div>