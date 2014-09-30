# -*- coding: utf-8 -*-
#
# Cookbook Name:: boilerplate
# Recipe:: npm_packages
#
# Copyright (C) 2014, Jun Nishikawa <topaz2@m0n0m0n0.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

include_recipe 'nodejs::nodejs_from_package'
%w(
  bower gfms grunt-cli jasmine-jquery jscs jshint
  karma karma-chrome-launcher karma-coverage
  karma-firefox-launcher karma-jasmine karma-phantomjs-launcher
).each do |package|
  nodejs_npm package
end
include_recipe 'phantomjs'
